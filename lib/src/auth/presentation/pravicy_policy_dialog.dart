import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learning/src/common_widget/common_dialog.dart';
import 'package:learning/src/menu_list_detail/privacy_policy.dart';

class PrivacyPolicyDialog extends StatelessWidget {
  const PrivacyPolicyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      isPolicy: true,
      title: 'လုံခြုံရေးမူ၀ါဒ',
      child: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    '''This privacy policy has been compiled to better serve those who are concerned with how their ‘Personally Identifiable Information’ (PII) is being used online. PII, as described in US privacy law and information security, is information that can be used on its own or with other information to identify, contact, or locate a single person, or to identify an individual in context. Please read our privacy policy carefully to get a clear understanding of how we collect, use, protect or otherwise handle your Personally Identifiable Information in accordance with our website.
                      What personal information do we collect from the people that visit our blog, website or app?
                      When ordering or registering on our site, as appropriate, you may be asked to enter your name, email address, phone number or other details to help you with your experience.
                      When do we collect information?
                      We collect information from you when you register on our site, subscribe to a newsletter, respond to a survey, fill out a form or enter information on our site.Provide us with feedback on our products or services
                      How do we use your information?
                      We may use the information we collect from you when you register, make a purchase, sign up for our newsletter, respond to a survey or marketing communication, surf the website, or use certain other site features in the following ways:
                      To personalize your experience and to allow us to deliver the type of content and product offerings in which you are most interested.
                      To improve our website in order to better serve you.
                      To allow us to better service you in responding to your customer service requests.
                      To administer a contest, promotion, survey or other site feature.
                      To ask for ratings and reviews of services or products
                      To follow up with them after correspondence (live chat, email or phone inquiries)
                      How do we protect your information?
                      We do not use vulnerability scanning and/or scanning to PCI standards.
                      We only provide articles and information. We never ask for credit card numbers.
                      We use regular Malware Scanning.
                      Your personal information is contained behind secured networks and is only accessible by a limited number of persons who have special access rights to such systems, and are required to keep the information confidential. In addition, all sensitive/credit information you supply is encrypted via Secure Socket Layer (SSL) technology.
                      We implement a variety of security measures when a user enters, submits, or accesses their information to maintain the safety of your personal information.
                      All transactions are processed through a gateway provider and are not stored or processed on our servers.
                      Do we use ‘cookies’?
                      Yes. Cookies are small files that a site or its service provider transfers to your computer’s hard drive through your Web browser (if you allow) that enables the site’s or service provider’s systems to recognize your browser and capture and remember certain information. For instance, we use cookies to help us remember and process the items in your shopping cart. They are also used to help us understand your preferences based on previous or current site activity, which enables us to provide you with improved services. We also use cookies to help us compile aggregate data about site traffic and site interaction so that we can offer better site experiences and tools in the future.We use cookies to:
                      • Compile aggregate data about site traffic and site interactions in order to offer better site experiences and tools in the future. We may also use trusted third-party services that track this information on our behalf.
                      You can choose to have your computer warn you each time a cookie is being sent, or you can choose to turn off all cookies. You do this through your browser settings. Since browser is a little different, look at your browser’s Help Menu to learn the correct way to modify your cookies.
                      If users disable cookies in their browser:
                      If you turn cookies off, Some of the features that make your site experience more efficient may not function properly.Some of the features that make your site experience more efficient and may not function properly.
                      Third-party disclosure
                      We do not sell, trade, or otherwise transfer to outside parties your Personally Identifiable Information.
                      Third-party links
                      We do not include or offer third-party products or services on our website.
                      Google
                      Google’s advertising requirements can be summed up by Google’s Advertising Principles. They are put in place to provide a positive experience for users. https://support.google.com/adwordspolicy/answer/1316548?hl=en
                      We have not enabled Google AdSense on our site but we may do so in the future.
                      California Online Privacy Protection Act
                      CalOPPA is the first state law in the nation to require commercial websites and online services to post a privacy policy. The law’s reach stretches well beyond California to require any person or company in the United States (and conceivably the world) that operates websites collecting Personally Identifiable Information from California consumers to post a conspicuous privacy policy on its website stating exactly the information being collected and those individuals or companies with whom it is being shared. – See more at: http://consumercal.org/california-online-privacy-protection-act-caloppa/#sthash.0FdRbT51.dpuf
                      According to CalOPPA, we agree to the following:
                      Users can visit our site anonymously.
                      Once this privacy policy is created, we will add a link to it on our home page or as a minimum, on the first significant page after entering our website.
                      Our Privacy Policy link includes the word ‘Privacy’ and can easily be found on the page specified above.
                      You will be notified of any Privacy Policy changes:
                      On our Privacy Policy Page
                      Can change your personal information:
                      By emailing us
                      How does our site handle Do Not Track signals?
                      We honor Do Not Track signals and Do Not Track, plant cookies, or use advertising when a Do Not Track (DNT) browser mechanism is in place.
                      Does our site allow third-party behavioral tracking?
                      It’s also important to note that we do not allow third-party behavioral tracking
                      COPPA (Children Online Privacy Protection Act)
                      When it comes to the collection of personal information from children under the age of 13 years old, the Children’s Online Privacy Protection Act (COPPA) puts parents in control. The Federal Trade Commission, United States’ consumer protection agency, enforces the COPPA Rule, which spells out what operators of websites and online services must do to protect children’s privacy and safety online.
                      We market to
                      We do not collect information from children under 13
                      children under 13.
                      Do we let third-parties, including ad networks or plug-ins collect PII from children under 13?
                      No
                      In order to remove your child’s information please contact the following personnel:
                      We adhere to the following COPPA tenants:
                      Parents can review, delete, manage or refuse with whom their child’s information is shared through contacting us directly. or contacting us directly.
                      Fair Information Practices
                      The Fair Information Practices Principles form the backbone of privacy law in the United States and the concepts they include have played a significant role in the development of data protection laws around the globe. Understanding the Fair Information Practice Principles and how they should be implemented is critical to comply with the various privacy laws that protect personal information.
                      In order to be in line with Fair Information Practices we will take the following responsive action, should a data breach occur:
                      We will notify you via email
                      Within 7 business days
                      We will notify the users via in-site notification
                      We also agree to the Individual Redress Principle which requires that individuals have the right to legally pursue enforceable rights against data collectors and processors who fail to adhere to the law. This principle requires not only that individuals have enforceable rights against data users, but also that individuals have recourse to courts or government agencies to investigate and/or prosecute non-compliance by data processors.
                      This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.
                      We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy.
                      Interpretation and Definitions
                      Interpretation
                      The words of which the initial letter is capitalized have meanings defined under the following conditions.
                      The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.
                      Definitions
                      For the purposes of this Privacy Policy:
                      You means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.
                      Company (referred to as either “the Company”, “We”, “Us” or “Our” in this Agreement) refers to 360edTech Corp.
                      Affiliate means an entity that controls, is controlled by or is under common control with a party, where “control” means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.
                      Account means a unique account created for You to access our Service or parts of our Service.
                      Website refers to www.360ed.org and www.360ed.com
                      Service refers to the Website.
                      Country refers to: The United States of America.
                      Service Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.
                      Third-party Social Media Service refers to any website or any social network website through which a User can log in or create an account to use the Service.
                      Facebook Fan Page is a public profile name specifically created by the Company on the Facebook social network, accessible from
                      Personal Data is any information that relates to an identified or identifiable individual.For the purposes of the CCPA, Personal Data means any information that identifies, relates to, describes or is capable of being associated with, or could reasonably be linked, directly or indirectly, with You.
                      Cookies are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.
                      Device means any device that can access the Service such as a computer, a cell phone or a digital tablet.
                      Usage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).
                      Business, for the purpose of the CCPA (California Consumer Privacy Act), refers to the Company as the legal entity that collects Consumers’ personal information and determines the purposes and means of the processing of Consumers’ personal information, or on behalf of which such information is collected and that alone, or jointly with others, determines the purposes and means of the processing of consumers’ personal information, that does business in the State of California.
                      Consumer, for the purpose of the CCPA (California Consumer Privacy Act), means a natural person who is a California resident. A resident, as defined in the law, includes (1) every individual who is in the USA for other than a temporary or transitory purpose, and (2) every individual who is domiciled in the USA who is outside the USA for a temporary or transitory purpose.
                      Sale, for the purpose of the CCPA (California Consumer Privacy Act), means selling, renting, releasing, disclosing, disseminating, making available, transferring, or otherwise communicating orally, in writing, or by electronic or other means, a Consumer’s personal information to another business or a third party for monetary or other valuable consideration.
                      Collecting and Using Your Personal Data
                      Types of Data Collected
                      Personal Data
                      While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:
                      Email address
                      First name and last name
                      Phone number
                      Address, State, Province, ZIP/Postal code, City
                      Usage Data
                      Usage Data
                      Usage Data is collected automatically when using the Service.
                      Usage Data may include information such as Your Device’s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.
                      When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.
                      We may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.
                      Tracking Technologies and Cookies
                      We use Cookies and similar tracking technologies to track the activity on Our Service and store certain information. Tracking technologies used are beacons, tags, and scripts to collect and track information and to improve and analyze Our Service. The technologies We use may include:
                      Cookies or Browser Cookies. A cookie is a small file placed on Your Device. You can instruct Your browser to refuse all Cookies or to indicate when a Cookie is being sent. However, if You do not accept Cookies, You may not be able to use some parts of our Service. Unless you have adjusted Your browser setting so that it will refuse Cookies, our Service may use Cookies.
                      Flash Cookies. Certain features of our Service may use local stored objects (or Flash Cookies) to collect and store information about Your preferences or Your activity on our Service. Flash Cookies are not managed by the same browser settings as those used for Browser Cookies. For more information on how You can delete Flash Cookies, please read “Where can I change the settings for disabling, or deleting local shared objects?” available at https://helpx.adobe.com/flash-player/kb/disable-local-shared-objects-flash.html#main_Where_can_I_change_the_settings_for_disabling__or_deleting_local_shared_objects_
                      Web Beacons. Certain sections of our Service and our emails may contain small electronic files known as web beacons (also referred to as clear gifs, pixel tags, and single-pixel gifs) that permit the Company, for example, to count users who have visited those pages or opened an email and for other related website statistics (for example, recording the popularity of a certain section and verifying system and server integrity).
                      Cookies can be “Persistent” or “Session” Cookies. Persistent Cookies remain on Your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close Your web browser.
                      We use both Session and Persistent Cookies for the purposes set out below:
                      Necessary / Essential Cookies
                      Type: Session Cookies
                      Administered by: Us
                      Purpose: These Cookies are essential to provide You with services available through the Website and to enable You to use some of its features. They help to authenticate users and prevent fraudulent use of user accounts. Without these Cookies, the services that You have asked for cannot be provided, and We only use these Cookies to provide You with those services.
                      Cookies Policy / Notice Acceptance Cookies
                      Type: Persistent Cookies
                      Administered by: Us
                      Purpose: These Cookies identify if users have accepted the use of cookies on the Website.
                      Functionality Cookies
                      Type: Persistent Cookies
                      Administered by: Us
                      Purpose: These Cookies allow us to remember choices You make when You use the Website, such as remembering your login details or language preference. The purpose of these Cookies is to provide You with a more personal experience and to avoid You having to re-enter your preferences every time You use the Website.
                      Tracking and Performance Cookies
                      Type: Persistent Cookies
                      Administered by: Third-Parties
                      Purpose: These Cookies are used to track information about traffic to the Website and how users use the Website. The information gathered via these Cookies may directly or indirectly identify you as an individual visitor. This is because the information collected is typically linked to a pseudonymous identifier associated with the device you use to access the Website. We may also use these Cookies to test new pages, features or new functionality of the Website to see how our users react to them.
                      For more information about the cookies we use and your choices regarding cookies, please visit our Cookies Policy.
                      Use of Your Personal Data
                      The Company may use Personal Data for the following purposes:
                      To provide and maintain our Service, including to monitor the usage of our Service.
                      To manage Your Account: to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.
                      For the performance of a contract: the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.
                      To contact You: To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application’s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.
                      To provide You with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.
                      To manage Your requests: To attend and manage Your requests to Us.
                      To deliver targeted advertising to You: We may use Your information to develop and display content and advertising (and work with third-party vendors who do so) tailored to Your interests and/or location and to measure its effectiveness.
                      For business transfers: We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.
                      For other purposes: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.
                      We may share Your personal information in the following situations:
                      With Service Providers: We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to advertise on third party websites to You after You visited our Service, for payment processing, to contact You.
                      For business transfers: We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.
                      With Affiliates: We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.
                      With business partners: We may share Your information with Our business partners to offer You certain products, services or promotions.
                      With other users: when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside. If You interact with other users or register through a Third-Party Social Media Service, Your contacts on the Third-Party Social Media Service may see You name, profile, pictures and description of Your activity. Similarly, other users will be able to view descriptions of Your activity, communicate with You and view Your profile.
                      With Your consent: We may disclose Your personal information for any other purpose with Your consent.
                      Retention of Your Personal Data
                      The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.
                      The Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.
                      Transfer of Your Personal Data
                      Your information, including Personal Data, is processed at the Company’s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to — and maintained on — computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ from those of Your jurisdiction.
                      Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to transfer Your Personal Data.
                      The Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.
                      Disclosure of Your Personal Data
                      Business Transactions
                      If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.
                      Law enforcement
                      Under certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).
                      Other legal requirements
                      The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:
                      Comply with a legal obligation
                      Protect and defend the rights or property of the Company
                      Prevent or investigate possible wrongdoing in connection with the Service
                      Protect the personal safety of Users of the Service or the public
                      Protect against legal liability
                      Security of Your Personal Data
                      The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.
                      Detailed Information on the Processing of Your Personal Data
                      The Service Providers We use may have access to Your Personal Data. These third-party vendors collect, store, use, process and transfer information about Your activity on Our Service in accordance with their Privacy Policies.
                      Analytics
                      We may use third-party Service providers to monitor and analyze the use of our Service.
                      Google Analytics
                      Google Analytics is a web analytics service offered by Google that tracks and reports website traffic. Google uses the data collected to track and monitor the use of our Service. This data is shared with other Google services. Google may use the collected data to contextualize and personalize the ads of its own advertising network.
                      You can opt-out of having made your activity on the Service available to Google Analytics by installing the Google Analytics opt-out browser add-on. The add-on prevents the Google Analytics JavaScript (ga.js, analytics.js and dc.js) from sharing information with Google Analytics about visits activity.
                      For more information on the privacy practices of Google, please visit the Google Privacy & Terms web page: https://policies.google.com/privacy?hl=en
                      Email Marketing
                      We may use Your Personal Data to contact You with newsletters, marketing or promotional materials and other information that may be of interest to You. You may opt-out of receiving any, or all, of these communications from Us by following the unsubscribe link or instructions provided in any email We send or by contacting Us.
                      We may use Email Marketing Service Providers to manage and send emails to You.
                      Mailchimp
                      Mailchimp is an email marketing platform provided by The Rocket Science Group LLC.
                      For more information on the privacy practices of Mailchimp, please visit their Privacy policy: https://mailchimp.com/legal/privacy/
                      Behavioral Remarketing
                      The Company uses remarketing services to advertise to You after You accessed or visited our Service. We and Our third-party vendors use cookies and non-cookie technologies to help Us recognize Your Device and understand how You use our Service so that We can improve our Service to reflect Your interests and serve You advertisements that are likely to be of more interest to You.
                      These third-party vendors collect, store, use, process and transfer information about Your activity on Our Service in accordance with their Privacy Policies and to enable Us to:
                      Measure and analyze traffic and browsing activity on Our Service
                      Show advertisements for our products and/or services to You on third-party websites or apps
                      Measure and analyze the performance of Our advertising campaigns
                      Some of these third-party vendors may use non-cookie technologies that may not be impacted by browser settings that block cookies. Your browser may not permit You to block such technologies. You can use the following third-party tools to decline the collection and use of information for the purpose of serving You interest-based advertising:
                      The NAI’s opt-out platform: http://www.networkadvertising.org/choices/
                      The EDAA’s opt-out platform http://www.youronlinechoices.com/
                      The DAA’s opt-out platform: http://optout.aboutads.info/?c=2&lang=EN
                      You may opt-out of all personalized advertising by enabling privacy features on Your mobile device such as Limit Ad Tracking (iOS) and Opt Out of Ads Personalization (Android). See Your mobile device Help system for more information.
                      We may share information, such as hashed email addresses (if available) or other online identifiers collected on Our Service with these third-party vendors. This allows Our third-party vendors to recognize and deliver You ads across devices and browsers. To read more about the technologies used by these third-party vendors and their cross-device capabilities please refer to the Privacy Policy of each vendor listed below.
                      The third-party vendors We use are:
                      Facebook
                      Facebook remarketing service is provided by Facebook Inc.
                      You can learn more about interest-based advertising from Facebook by visiting this page: https://www.facebook.com/help/516147308587266
                      To opt-out from Facebook’s interest-based ads, follow these instructions from Facebook: https://www.facebook.com/help/568137493302217
                      Facebook adheres to the Self-Regulatory Principles for Online Behavioral Advertising established by the Digital Advertising Alliance. You can also opt-out from Facebook and other participating companies through the Digital Advertising Alliance in the USA http://www.aboutads.info/choices/, the Digital Advertising Alliance of Canada in Canada http://youradchoices.ca/ or the European Interactive Digital Advertising Alliance in Europe http://www.youronlinechoices.eu/, or opt-out using your mobile device settings.
                      For more information on the privacy practices of Facebook, please visit Facebook’s Data Policy: https://www.facebook.com/privacy/explanation
                      Payments
                      We may provide paid products and/or services within the Service. In that case, we may use third-party services for payment processing (e.g. payment processors).
                      We will not store or collect Your payment card details. That information is provided directly to Our third-party payment processors whose use of Your personal information is governed by their Privacy Policy. These payment processors adhere to the standards set by PCI-DSS as managed by the PCI Security Standards Council, which is a joint effort of brands like Visa, Mastercard, American Express and Discover. PCI-DSS requirements help ensure the secure handling of payment information.
                      Stripe
                      Their Privacy Policy can be viewed at https://stripe.com/us/privacy
                      PayPal
                      Their Privacy Policy can be viewed at https://www.paypal.com/webapps/mpp/ua/privacy-full
                      CCPA Privacy
                      This privacy notice section for California residents supplements the information contained in Our Privacy Policy and it applies solely to all visitors, users, and others who reside in the State of California.
                      Categories of Personal Information Collected
                      We collect information that identifies, relates to, describes, references, is capable of being associated with, or could reasonably be linked, directly or indirectly, with a particular Consumer or Device. The following is a list of categories of personal information which we may collect or may have been collected from California residents within the last twelve (12) months.
                      Please note that the categories and examples provided in the list below are those defined in the CCPA. This does not mean that all examples of that category of personal information were in fact collected by Us, but reflects our good faith belief to the best of our knowledge that some of that information from the applicable category may be and may have been collected. For example, certain categories of personal information would only be collected if You provided such personal information directly to Us.
                      Category A: Identifiers.
                      Examples: A real name, alias, postal address, unique personal identifier, online identifier, Internet Protocol address, email address, account name, driver’s license number, passport number, or other similar identifiers.
                      Collected: Yes.
                      Category B: Personal information categories listed in the California Customer Records statute (Cal. Civ. Code § 1798.80(e)).
                      Examples: A name, signature, Social Security number, physical characteristics or description, address, telephone number, passport number, driver’s license or state identification card number, insurance policy number, education, employment, employment history, bank account number, credit card number, debit card number, or any other financial information, medical information, or health insurance information. Some personal information included in this category may overlap with other categories.
                      Collected: Yes.
                      Category C: Protected classification characteristics under California or federal law.
                      Examples: Age (40 years or older), race, color, ancestry, national origin, citizenship, religion or creed, marital status, medical condition, physical or mental disability, sex (including gender, gender identity, gender expression, pregnancy or childbirth and related medical conditions), sexual orientation, veteran or military status, genetic information (including familial genetic information).
                      Collected: No.
                      Category D: Commercial information.
                      Examples: Records and history of products or services purchased or considered.
                      Collected: Yes.
                      Category E: Biometric information.
                      Examples: Genetic, physiological, behavioral, and biological characteristics, or activity patterns used to extract a template or other identifier or identifying information, such as, fingerprints, faceprints, and voiceprints, iris or retina scans, keystroke, gait, or other physical patterns, and sleep, health, or exercise data.
                      Collected: No.
                      Category F: Internet or other similar network activity.
                      Examples: Interaction with our Service or advertisement.
                      Collected: Yes.
                      Category G: Geolocation data.
                      Examples: Approximate physical location.
                      Collected: No.
                      Category H: Sensory data.
                      Examples: Audio, electronic, visual, thermal, olfactory, or similar information.
                      Collected: No.
                      Category I: Professional or employment-related information.
                      Examples: Current or past job history or performance evaluations.
                      Collected: No.
                      Category J: Non-public education information (per the Family Educational Rights and Privacy Act (20 U.S.C. Section 1232g, 34 C.F.R. Part 99)).
                      Examples: Education records directly related to a student maintained by an educational institution or party acting on its behalf, such as grades, transcripts, class lists, student schedules, student identification codes, student financial information, or student disciplinary records.
                      Collected: No.
                      Category K: Inferences drawn from other personal information.
                      Examples: Profile reflecting a person’s preferences, characteristics, psychological trends, predispositions, behavior, attitudes, intelligence, abilities, and aptitudes.
                      Collected: No.
                      Under CCPA, personal information does not include:
                      Publicly available information from government records
                      Deidentified or aggregated consumer information
                      Information excluded from the CCPA’s scope, such as:
                      Health or medical information covered by the Health Insurance Portability and Accountability Act of 1996 (HIPAA) and the California Confidentiality of Medical Information Act (CMIA) or clinical trial data
                      Personal Information covered by certain sector-specific privacy laws, including the Fair Credit Reporting Act (FRCA), the Gramm-Leach-Bliley Act (GLBA) or California Financial Information Privacy Act (FIPA), and the Driver’s Privacy Protection Act of 1994
                      Sources of Personal Information
                      We obtain the categories of personal information listed above from the following categories of sources:
                      Directly from You. For example, from the forms You complete on our Service, preferences You express or provide through our Service, or from Your purchases on our Service.
                      Indirectly from You. For example, from observing Your activity on our Service.
                      Automatically from You. For example, through cookies We or our Service Providers set on Your Device as You navigate through our Service.
                      From Service Providers. For example, third-party vendors to monitor and analyze the use of our Service, third-party vendors to deliver targeted advertising to You, third-party vendors for payment processing, or other third-party vendors that We use to provide the Service to You.
                      Use of Personal Information for Business Purposes or Commercial Purposes
                      We may use or disclose personal information We collect for “business purposes” or “commercial purposes” (as defined under the CCPA), which may include the following examples:
                      To operate our Service and provide You with our Service.
                      To provide You with support and to respond to Your inquiries, including to investigate and address Your concerns and monitor and improve our Service.
                      To fulfill or meet the reason You provided the information. For example, if You share Your contact information to ask a question about our Service, We will use that personal information to respond to Your inquiry. If You provide Your personal information to purchase a product or service, We will use that information to process Your payment and facilitate delivery.
                      To respond to law enforcement requests and as required by applicable law, court order, or governmental regulations.
                      As described to You when collecting Your personal information or as otherwise set forth in the CCPA.
                      For internal administrative and auditing purposes.
                      To detect security incidents and protect against malicious, deceptive, fraudulent or illegal activity, including, when necessary, to prosecute those responsible for such activities.
                      Please note that the examples provided above are illustrative and not intended to be exhaustive. For more details on how we use this information, please refer to the “Use of Your Personal Data” section.
                      If We decide to collect additional categories of personal information or use the personal information We collected for materially different, unrelated, or incompatible purposes We will update this Privacy Policy.
                      Disclosure of Personal Information for Business Purposes or Commercial Purposes
                      We may use or disclose and may have used or disclosed in the last twelve (12) months the following categories of personal information for business or commercial purposes:
                      Category A: Identifiers
                      Category B: Personal information categories listed in the California Customer Records statute (Cal. Civ. Code § 1798.80(e))
                      Category D: Commercial information
                      Category F: Internet or other similar network activity
                      Please note that the categories listed above are those defined in the CCPA. This does not mean that all examples of that category of personal information were in fact disclosed, but reflects our good faith belief to the best of our knowledge that some of that information from the applicable category may be and may have been disclosed.
                      When We disclose personal information for a business purpose or a commercial purpose, We enter a contract that describes the purpose and requires the recipient to both keep that personal information confidential and not use it for any purpose except performing the contract.
                      Sale of Personal Information
                      As defined in the CCPA, “sell” and “sale” mean selling, renting, releasing, disclosing, disseminating, making available, transferring, or otherwise communicating orally, in writing, or by electronic or other means, a consumer’s personal information by the business to a third party for valuable consideration. This means that We may have received some kind of benefit in return for sharing personal information, but not necessarily a monetary benefit.
                      Please note that the categories listed below are those defined in the CCPA. This does not mean that all examples of that category of personal information were in fact sold, but reflects our good faith belief to the best of our knowledge that some of that information from the applicable category may be and may have been shared for value in return.
                      We may sell and may have sold in the last twelve (12) months the following categories of personal information:
                      Category A: Identifiers
                      Category B: Personal information categories listed in the California Customer Records statute (Cal. Civ. Code § 1798.80(e))
                      Category D: Commercial information
                      Category F: Internet or other similar network activity
                      Share of Personal Information
                      We may share Your personal information identified in the above categories with the following categories of third parties:
                      Service Providers
                      Payment processors
                      Our affiliates
                      Our business partners
                      Third party vendors to whom You or Your agents authorize Us to disclose Your personal information in connection with products or services We provide to You
                      Sale of Personal Information of Minors Under 16 Years of Age
                      We do not sell the personal information of Consumers We actually know are less than 16 years of age, unless We receive affirmative authorization (the “right to opt-in”) from either the Consumer who is between 13 and 16 years of age, or the parent or guardian of a Consumer less than 13 years of age. Consumers who opt-in to the sale of personal information may opt-out of future sales at any time. To exercise the right to opt-out, You (or Your authorized representative) may submit a request to Us by contacting Us.
                      If You have reason to believe that a child under the age of 13 (or 16) has provided Us with personal information, please contact Us with sufficient detail to enable Us to delete that information.
                      Your Rights under the CCPA
                      The CCPA provides California residents with specific rights regarding their personal information. If You are a resident of California, You have the following rights:
                      The right to notice. You have the right to be notified which categories of Personal Data are being collected and the purposes for which the Personal Data is being used.
                      The right to request. Under CCPA, You have the right to request that We disclose information to You about Our collection, use, sale, disclosure for business purposes and share of personal information. Once We receive and confirm Your request, We will disclose to You:
                      The categories of personal information We collected about You
                      The categories of sources for the personal information We collected about You
                      Our business or commercial purpose for collecting or selling that personal information
                      The categories of third parties with whom We share that personal information
                      The specific pieces of personal information We collected about You
                      If we sold Your personal information or disclosed Your personal information for a business purpose, We will disclose to You:
                      The categories of personal information categories sold
                      The categories of personal information categories disclosed
                      The right to say no to the sale of Personal Data (opt-out). You have the right to direct Us to not sell Your personal information. To submit an opt-out request please contact Us.
                      The right to delete Personal Data. You have the right to request the deletion of Your Personal Data, subject to certain exceptions. Once We receive and confirm Your request, We will delete (and direct Our Service Providers to delete) Your personal information from our records, unless an exception applies. We may deny Your deletion request if retaining the information is necessary for Us or Our Service Providers to:
                      Complete the transaction for which We collected the personal information, provide a good or service that You requested, take actions reasonably anticipated within the context of our ongoing business relationship with You, or otherwise perform our contract with You.
                      Detect security incidents, protect against malicious, deceptive, fraudulent, or illegal activity, or prosecute those responsible for such activities.
                      Debug products to identify and repair errors that impair existing intended functionality.
                      Exercise free speech, ensure the right of another consumer to exercise their free speech rights, or exercise another right provided for by law.
                      Comply with the California Electronic Communications Privacy Act (Cal. Penal Code § 1546 et. seq.).
                      Engage in public or peer-reviewed scientific, historical, or statistical research in the public interest that adheres to all other applicable ethics and privacy laws, when the information’s deletion may likely render impossible or seriously impair the research’s achievement, if You previously provided informed consent.
                      Enable solely internal uses that are reasonably aligned with consumer expectations based on Your relationship with Us.
                      Comply with a legal obligation.
                      Make other internal and lawful uses of that information that are compatible with the context in which You provided it.
                      The right not to be discriminated against. You have the right not to be discriminated against for exercising any of Your consumer’s rights, including by:
                      Denying goods or services to You
                      Charging different prices or rates for goods or services, including the use of discounts or other benefits or imposing penalties
                      Providing a different level or quality of goods or services to You
                      Suggesting that You will receive a different price or rate for goods or services or a different level or quality of goods or services
                      Exercising Your CCPA Data Protection Rights
                      In order to exercise any of Your rights under the CCPA, and if You are a California resident, You can contact Us:
                      By visiting this page on our website: www.360ed.org
                      Only You, or a person registered with the California Secretary of State that You authorize to act on Your behalf, may make a verifiable request related to Your personal information.
                      Your request to Us must:
                      Provide sufficient information that allows Us to reasonably verify that You are the person about whom We collected personal information or an authorized representative
                      Describe Your request with sufficient detail that allows Us to properly understand, evaluate, and respond to it
                      We cannot respond to Your request or provide You with the required information if we cannot:
                      Verify Your identity or authority to make the request
                      And confirm that the personal information relates to You
                      We will disclose and deliver the required information free of charge within 45 days of receiving Your verifiable request. The time period to provide the required information may be extended once by an additional 45 days when reasonably necessary and with prior notice.
                      Any disclosures We provide will only cover the 12-month period preceding the verifiable request’s receipt.
                      For data portability requests, We will select a format to provide Your personal information that is readily usable and should allow You to transmit the information from one entity to another entity without hindrance.
                      Do Not Sell My Personal Information
                      You have the right to opt-out of the sale of Your personal information. Once We receive and confirm a verifiable consumer request from You, we will stop selling Your personal information. To exercise Your right to opt-out, please contact Us.
                      The Service Providers we partner with (for example, our analytics or advertising partners) may use technology on the Service that sells personal information as defined by the CCPA law. If you wish to opt out of the use of Your personal information for interest-based advertising purposes and these potential sales as defined under CCPA law, you may do so by following the instructions below.
                      Please note that any opt out is specific to the browser You use. You may need to opt out on every browser that You use.
                      Website
                      You can opt out of receiving ads that are personalized as served by our Service Providers by following our instructions presented on the Service:
                      The NAI’s opt-out platform: http://www.networkadvertising.org/choices/
                      The EDAA’s opt-out platform http://www.youronlinechoices.com/
                      The DAA’s opt-out platform: http://optout.aboutads.info/?c=2&lang=EN
                      The opt out will place a cookie on Your computer that is unique to the browser You use to opt out. If you change browsers or delete the cookies saved by your browser, You will need to opt out again.
                      Mobile Devices
                      Your mobile device may give you the ability to opt out of the use of information about the apps you use in order to serve you ads that are targeted to your interests:
                      “Opt out of Interest-Based Ads” or “Opt out of Ads Personalization” on Android devices
                      “Limit Ad Tracking” on iOS devices
                      You can also stop the collection of location information from Your mobile device by changing the preferences on Your mobile device.
                      “Do Not Track” Policy as Required by California Online Privacy Protection Act (CalOPPA)
                      Our Service does not respond to Do Not Track signals.
                      However, some third party websites do keep track of You browsing activities. If You are visiting such websites, You can set Your preferences in Your web browser to inform websites that You do not want to be tracked. You can enable or disable DNT by visiting the preferences or settings page of Your web browser.
                      Your California Privacy Rights (California’s Shine the Light law)
                      Under California Civil Code Section 1798 (California’s Shine the Light law), California residents with an established business relationship with us can request information once a year about sharing their Personal Data with third parties for the third parties’ direct marketing purposes.
                      If you’d like to request more information under the California Shine the Light law, and if You are a California resident, You can contact Us using the contact information provided below.
                      California Privacy Rights for Minor Users (California Business and Professions Code Section 22581)
                      California Business and Professions Code section 22581 allow California residents under the age of 18 who are registered users of online sites, services or applications to request and obtain removal of content or information they have publicly posted.
                      To request removal of such data, and if You are a California resident, You can contact Us using the contact information provided below, and include the email address associated with Your account.
                      Be aware that Your request does not guarantee complete or comprehensive removal of content or information posted online and that the law may not permit or require removal in certain circumstances.
                      Links to Other Websites
                      Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party’s site. We strongly advise You to review the Privacy Policy of every site You visit.
                      We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.
                      Changes to this Privacy Policy
                      We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.
                      We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the “Last updated” date at the top of this Privacy Policy.
                      You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.
                      Contact Us
                      If you have any questions about this Privacy Policy, You can contact us:
                      By visiting this page on our website: www.360ed.org''',
                    strutStyle: StrutStyle(height: .8),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 300,
            height: 20,
          )
        ],
      ),
    );
  }
}
