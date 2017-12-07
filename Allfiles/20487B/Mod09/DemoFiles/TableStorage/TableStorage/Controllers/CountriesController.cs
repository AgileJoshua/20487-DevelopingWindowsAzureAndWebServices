using Microsoft.Azure;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Table;
using System;
using System.Collections.Generic;
using System.Data.Services.Client;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TableStorage.Controllers
{

    public class TableContext
    {

        const string CountriesTable = "Countries";
        private readonly CloudTable countryTable;
        TableBatchOperation _countryBatch = null;
        private TableBatchOperation CountryBatch
        {
            get
            {
                if (_countryBatch == null) _countryBatch = new TableBatchOperation();
                return _countryBatch;
            }
            set
            {
                _countryBatch = value;
            }
        }
        public TableQuery<Country> Countries { get { return countryTable.CreateQuery<Country>(); } }
        public TableContext()
        {
            // Connect to the storage account
            CloudStorageAccount storageAccount =
                CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("StorageAccount"));

            CloudTableClient tableClient = storageAccount.CreateCloudTableClient();
            // Verify the table exists
            CloudTable table = tableClient.GetTableReference(CountriesTable);
            table.CreateIfNotExists();

            countryTable = tableClient.GetTableReference("Countries");

        }

        public void Add(Country country)
        {
            var insert = TableOperation.Insert(country);
            CountryBatch.Add(insert);
        }

        public void Save()
        {
            if (CountryBatch.Count > 0)
                countryTable.ExecuteBatch(CountryBatch);
            CountryBatch = null;
        }
    }
    public class CountriesController : Controller
    {

        private TableContext GetTableContext()
        {

            return new TableContext();
        }

        public ActionResult Index(string continent)
        {
            var tableContext = GetTableContext();
            List<Country> countries;
            if (string.IsNullOrEmpty(continent))
            {
                // No specific continent required. Retrieve entire table content
                countries = tableContext.Countries.ToList();
            }
            else
            {
                // Filter by continent
                IQueryable<Country> query =
                    from e in tableContext.Countries
                    where e.PartitionKey == continent
                    select e;
                countries = query.ToList();
            }
            return View(countries);
        }

        [HttpPost]
        public ActionResult Add(FormCollection collection)
        {
            // Create the country entity from the form content
            Country country = new Country(collection["Name"], collection["Continent"])
            {
                Language = collection["Language"]
            };

            // Add the country entity to the table
            TableContext tableContext = GetTableContext();

            tableContext.Add(country);
            tableContext.Save();

            // Reload the countries list
            return RedirectToAction("Index");
        }
    }
}
