---
layout: page
permalink: /industry/
---

 <head>
 <link rel="stylesheet" href="/assets/css/main.css">
<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://madaan.github.io/assets/js/common.js"></script>
 </head>

### Industry Experience So Far

Oracle and Visa have given me an opportunity to work on very exciting and impactful problems. The experience continues to help me in imbibing a number of street-smart skills to deal with massive scale, building systems that run like a clock, applying machine learning to datasets of various shapes, forms, and sizes and thinking thoroughly about maintainability, extensibility, and change. A lot of the _good habits_ mentioned in [this blog](http://madaan.github.io/wbc/) from last year came from working on relevant problems in an industrial setting.

Some of the projects that I've worked on both at Oracle and in Visa are listed below. I can only share a limited amount of details about these projects, but if you have specific questions about the technical aspects of any of these problems, please feel free to reach out to me.


#### ***Oracle***

- **Wiki Bot** 
Software teams usually have a large number of wiki pages that are used to document their processes and contain information on the resources (like databases, code structure, etc.) The task then was to create a chatbot that can directly answer questions from such wikis, thereby reducing the time it takes for a support/operations engineer to resolve an issue (they can directly ask questions to the chatbot, as opposed to going through wikis or hunting for people who may know the answer). Additionally, each unanswered query highlighted undocumented information that can be subsequently added to the wiki, thus helping in maintaining high-quality wiki pages.

- **Analytics Cloud Platform 360°** Responsible for design and development of an analytics platform that extracts usage insights for Oracle BI applications. The platform is fed data from multifarious sources, including query server logs, support request tickets dataset and bugs database. The insights produced include metrics to quantify customer sentiment, customer engagement levels, discover recurring paths in the bug/support request flow, conversation analysis and detection and analysis of _outlier_ queries _(for example, those with runtime > 99<sup>th</sup> percentile of the run times in the last one week)_.

#### ***Visa***

- **Deep Learning for Predicting Card-Level Attributes** Led one of the first efforts across Visa Engineering teams to develop a Deep Learning stack that scales to Visa Data. The solution was used to train credit card attribute prediction models and run inference for each of the ~ 500 million Visa cards.
- **Visa Card Upgrade Model** Led the development of a card upgrade model to predict cardholders that should be offered a level up to the Visa Signature card type. Using novel feature engineering and the ability to work at individual transaction level features, the model was able to beat existing TreeNet based solution in terms of both speed and accuracy.
- **SpendBot** Designed and developed a chatbot that allows users to ask questions in natural language about their spend habits. For example, “how much am I spending on meals?”.
- **Customer Segmentation Platform** Responsible for design and development of predictive models and big data pipeline for a data segmentation platform. The models and aggregating pipelines processed transaction data from half a billion Visa Card holders for over 10000 merchants every day. The solution helped in scaling the business 100x in terms of revenue. [Visa Ad Solutions](https://usa.visa.com/run-your-business/commercial-solutions/solutions/advertising-loyalty-card-programs.html) is one of the primary customers of the platform.
- **Audience Delivery Service** Designed and developed a multi-tenant Spark server built on top of novel scoring algorithms that perform data segmentation and scoring at scale and enables the delivery of hundreds of audience segments a day.
