# Module 1: Overview of Service and Cloud Technologies

# Lesson 4: Cloud Computing

### Demonstration: Exploring the Microsoft Azure portal

#### Preparation Steps

  >**Note**: This demonstration requires an Azure account. Make sure you have a valid account before starting the demonstration.

#### Demonstration Steps

1. Open a browser (e.g. - Edge)
2. Navigate to **https://portal.azure.com**.
3. If a page appears, prompting for your email address, type your email address, and then click **Continue**. Wait for the **Sign In** page to appear, type your email address and password, and then click **Sign In**.

   >**Note** : During the sign-in process, if a page appears prompting you to choose from a list of previously used accounts, select the account that you previously used, and then continue to provide your credentials.

4. Review the items in the pane on the left side of the screen and understand the different services that you can manage with the Azure portal.
5. Click **+ New** on the left side of the portal. Click **Web App**. The **App Name** and **Resource Group** text boxes and **App Service Plan/Location** display on the right side of the screen.
6. In the **App Name** text box, type the following web app name: **WebAppDemoYourInitials** (Replace **YourInitials** with your initials).
  > The app name you typed is going to be part of the URL that you will use when connecting to the web application.
7. In the **Resource Group** text box, select **Create new**.
8. Click **App Service Plan/Location**  and then click **Create new**.
9. In **App Service Plan** enter **BlueYonder**.
10. In **Location** select the location that is closest to you.
11. Click **Ok**
12. Click **Create** and wait until the web app is deployed.
13. In the **All Resources** pane, click the web app that you created in the previous step (the one that is named **WebAppDemoYourInitials**.
14. Currently the web app has no content. In module 06, &quot;Hosting Services&quot;, you will see how to publish web apps using Visual Studio 2017.
15. Go over the different sections and understand their purpose:  
  a. **General** (no section) -  Provides an overview about the activity of the web app, access control and metadata.
  b. **Deployment** - controls how and when the application is deployed.
  c. **Settings** - Allows you to control settings such as monitoring capabilities, remote access, security tokens, scaling and more.
14. Close the browser.

# Lesson 5: Exploring the Blue Yonder Airlines&#39; Travel Companion Application

### Demonstration: Using the Travel Companion Application   

#### Demonstration Steps

1. Open the file explorer and go to **[repository root]\AllFiles\20487C\Mod01\DemoFiles\BlueYonderDemo\Setup**.
   > Substitute **[repository root]** with the absolute path to which you cloned the 20487 repository.
   > For example, if you cloned the repository to **C:\Users\JohnDoe\20487** then the path above will become "**C:\Users\JohnDoe\20487\AllFiles\20487C\Mod01\DemoFiles\BlueYonderDemo\Setup**"
2. Right click the **SetupIIS.cmd** file and click **Run as Administrator**.
3. Click **Yes** and wait for the script to finish.
4. This script builds the server solutions and deploys them to the local IIS server.
5. Open **Visual Studio 2017**
6. On the **File** menu, point to **Open** , and then click **Project/Solution**.
7. Go to **[repository root]\AllFiles\20487C\Mod01\DemoFiles\BlueYonderDemo\BlueYonder.Companion.Client** ,select the **BlueYonder.Companion.Client.sln** file, and then click **Open**.
8. If the **Developers License** dialog box displays, click **I Agree**.
9. If the **User Account Control** dialog box displays, click **Yes**.
10. In the **Developers License** dialog box, type your email address and a password, and then click **Sign in**.
11. In the **Developers License** dialog box, click **Close**.

   >**Note** : If you do not have valid email address, click **Sign up** and register for the service.  
   >Write down these credentials and use them whenever you are required to use an email address.

12. In Solution Explorer, right-click the **BlueYonder.Companion.Client** project, and then click **Set as StartUp Project**.
13. Press Ctrl+F5 to start the client app without debugging.
14. If you are prompted to allow the app to run in the background, click **Allow**.
15. Understand the purpose and features of the Blue Yonder Companion app: it is a travel reservation and management app. It can help you search and book flights, manage your trip schedule, store and manage pictures and videos from trips, and provide weather information for your trip destinations.
16. After the client app starts, right-click or swipe from the bottom of the screen to open the app bar.
17. Click **Search** , and then in the **Search** text box, type **New**.
18. If you are prompted to allow the app to share your location, click **Allow**.
19. The app communicates with the front-end service to retrieve a list of flights to a location whose name begins with _New_, for example, New York.
20. Select any destination from the list of search results, and then click the **Purchase this trip** link.
21. In the **First Name** text box, type your first name.
22. In the **Last Name** text box, type your last name.
23. In the **Passport** text box, type **Aa1234567**.
24. In the **Mobile Phone** text box, type **555-5555555**.
25. In the **Home Address** text box, type **423 Main St.**
26. In the **Email Address** text box, type your email address.
27. Click **Purchase**.
28. Now the app sends the purchase request to the front-end service. The front-end service saves the purchase information and then sends a separate purchase request to the back-end service for additional processing. After the back-end and front-end services complete their task, the client app displays a confirmation message.
29. You will implement the purchase feature, including the back-end service purchase feature, in the upcoming labs.
30. Click **Close** to close the confirmation message.
31. On the **Blue Yonder Companion** page, point to **New York at a Glance** , and notice that the weather forecast is also retrieved from the front-end service. You will implement the weather service in the upcoming labs.
32. Click the current trip from Seattle to New York.
33. On the **Current Trip** page, right-click or swipe from the bottom of the screen to display the app bar, and then click **Media**.
34. On the **Media** page, right-click or swipe from the bottom of the screen to display the app bar.
35. Review the available buttons. You can upload images and videos to Azure Storage, and share them with other clients.
36. You will implement the upload and download features in the upcoming labs.

   >**Note** : Do not click the upload buttons, because you have not created any Azure Storage accounts yet. If you click any of the upload buttons, the app will fail and close.

37. Close the client app.

©2017 Microsoft Corporation. All rights reserved.

The text in this document is available under the  [Creative Commons Attribution 3.0 License](https://creativecommons.org/licenses/by/3.0/legalcode), additional terms may apply. All other content contained in this document (including, without limitation, trademarks, logos, images, etc.) are  **not**  included within the Creative Commons license grant. This document does not provide you with any legal rights to any intellectual property in any Microsoft product. You may copy and use this document for your internal, reference purposes.

This document is provided &quot;as-is.&quot; Information and views expressed in this document, including URL and other Internet Web site references, may change without notice. You bear the risk of using it. Some examples are for illustration only and are fictitious. No real association is intended or inferred. Microsoft makes no warranties, express or implied, with respect to the information provided here.
