<!--
Hey, thanks for using the awesome-readme-template template.  
If you have any enhancements, then fork this project and create a pull request 
or just open an issue with the label "enhancement".

Don't forget to give this project a star for additional support ;)
Maybe you can mention me or this repo in the acknowledgements too
-->
<div align="center">

  <div align="center"> 
    <img src="./app/assets/images/jasmine_dragon_logo.jpg" alt="The logo for the service."  width="448" height="354" />
  </div>

  <h1>The Jasmine Dragon</h1>
  
  <p>
    An awesome README template for your projects! 
  </p>
  
  
<!-- Badges -->
<p>
  <a href="https://github.com/cece-132/jasmine_dragon/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/cece-132/jasmine_dragon" alt="contributors" />
  </a>
  <a href="">
    <img src="https://img.shields.io/github/last-commit/cece-132/jasmine_dragon" alt="last update" />
  </a>
  <a href="https://github.com/cece-132/jasmine_dragon/network/members">
    <img src="https://img.shields.io/github/forks/cece-132/jasmine_dragon" alt="forks" />
  </a>
  <a href="https://github.com/cece-132/jasmine_dragon/stargazers">
    <img src="https://img.shields.io/github/stars/cece-132/jasmine_dragon" alt="stars" />
  </a>
  <a href="https://github.com/cece-132/jasmine_dragon/issues/">
    <img src="https://img.shields.io/github/issues/cece-132/jasmine_dragon" alt="open issues" />
  </a>
  <a href="https://github.com/cece-132/jasmine_dragon/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/cece-132/jasmine_dragon.svg" alt="license" />
  </a>
</p>
   
<h4>
    <a href="https://github.com/Louis3797/awesome-readme-template/">View Demo</a>
  <span> · </span>
    <a href="https://github.com/cece-132/jasmine_dragon">Documentation</a>
  <span> · </span>
    <a href="https://github.com/cece-132/jasmine_dragon/issues/">Report Bug</a>
  <span> · </span>
    <a href="https://github.com/cece-132/jasmine_dragon/issues/">Request Feature</a>
  </h4>
</div>

<br />

<!-- Table of Contents -->
# :notebook_with_decorative_cover: Table of Contents

- [About the Project](#star2-about-the-project)
  * [Screenshots](#camera-screenshots)
  * [Tech Stack](#space_invader-tech-stack)
  * [Features](#dart-features)
  * [Environment Variables](#key-endpoints)
- [Getting Started](#toolbox-getting-started)
  * [Prerequisites](#bangbang-prerequisites)
  * [Installation](#gear-installation)
  * [Running Tests](#test_tube-running-tests)
  * [Run Locally](#running-run-locally)
  * [Deployment](#triangular_flag_on_post-deployment)
- [Usage](#eyes-usage)
- [Roadmap](#compass-roadmap)
- [Stetch Goals](#smirk-stretch-goals)
- [Contributing](#wave-contributing)
- [FAQ](#grey_question-faq)
- [Contact](#handshake-contact)
- [Acknowledgements](#gem-acknowledgements)

  

<!-- About the Project -->
## :star2: About the Project

<!-- Screenshots -->
### :camera: Screenshots

<div align="center"> 
  <img src="./app/assets/images/schema.jpg" alt="The schema of the project includes 4 tables."  width="330" height="774" />
</div>


<!-- TechStack -->
### :space_invader: Tech Stack

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Rails</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://www.typescriptlang.org/">Typescript</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<details>
<summary>DevOps</summary>
  <ul>
    <li><a href="https://circleci.com/">CircleCLI</a></li>
  </ul>
</details>

<!-- Features -->
### :dart: Features

- An endpoint to subscribe a customer to a tea subscription
- An endpoint to cancel a customer’s tea subscription
- An endpoint to see all of a customer’s subsciptions (active and cancelled)

<!-- Env Variables -->
### :key: Endpoints

Here are the endpoints for this project:

 - Customer Subscription creation. Associates a customer_id with an subscription_id
 ```bash
  post "/api/v1/customer_subscription"
 ```

 - Customer Subscription update. Can update the status of the customer subscription
 ```bash
  patch "/api/v1/customer_subscription"
 ```

 - Customer Subscription Index. The associated customer lists all their subscriptions
 ```bash
  get "/customer_subscription/:id"
 ```

  - Customer Subscription Destroy. The associated customer detroys all their subscription
 ```bash
  delete "/customer_subscription/:id"
 ```


<!-- Getting Started -->
## 	:toolbox: Getting Started

<!-- Prerequisites -->
### :bangbang: Prerequisites

This project uses `Rails 5.2.8.1` and `Ruby 2.7.2`
   
<!-- Running Tests -->
### :test_tube: Running Tests

To run tests, run the following command

```bash
  bundle exec rspec spec
```

<!-- Run Locally -->
### :running: Run Locally

Clone the project

```bash
  git clone https://github.com/cece-132/jasmine_dragon.git
```

Go to the project directory

```bash
  cd jasmine_dragon
```

Start the server

```bash
  rails server
```


<!-- Deployment -->
### :triangular_flag_on_post: Deployment

To deploy this project open

```bash
  localhost:3000
```


<!-- Usage -->
## :eyes: Usage

This API is an api that is going to manage a tea subscription service. A user can manage the subscriptions they are subscribed to as well as the tea's associated with that customer's subscription. Subscriptions have teas in this api. This is to allow the customer to have mutliple subscriptions to different types of 'Tea packages'.


<!-- Roadmap -->
## :compass: Roadmap

* [x] An endpoint to subscribe a customer to a tea subscription
* [x] An endpoint to cancel a customer’s tea subscription
* [x] An endpoint to see all of a customer’s subsciptions (active and cancelled)

## :smirk: Stretch Goals

* [ ] Create a Tea API that holds tea information that I need for this API that has basic CRUD could be fun to consume.


<!-- Contributing -->
## :wave: Contributing

<a href="https://github.com/Louis3797/awesome-readme-template/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Louis3797/awesome-readme-template" />
</a>


Contributions are always welcome!

See `contributing.md` for ways to get started.


<!-- FAQ -->
## :grey_question: FAQ

- Why enums?

  + Being able to utilize the error handling that is already provided in ActiveRecord is a favorite for me. I was able to ensure that no matter what value was sent through the fe I am able to control how this is data is handled. Initially I was going to have all my enums represented as number values, but decided that to be more empathetic to the fe-dev or even another be-dev having the values set as word strings instead made it a lot easier to understand right off the bat.



<!-- Contact -->
## :handshake: Contact

Candace Eckels - [LinkedIn](https://www.linkedin.com/in/candace-eckels-b66089201/) - candace.eckels@gmail.com

Project Link: [https://github.com/cece-132/jasmine_dragon](https://github.com/cece-132/jasmine_dragon)


<!-- Acknowledgments -->
## :gem: Acknowledgements

Round of applause for the resources I was able to use in this project
 - [DB Designer](https://www.dbdesigner.net/)
 - [Awesome README](https://github.com/matiassingers/awesome-readme)
 - [Emoji Cheat Sheet](https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md#travel--places)
 - [Logo](https://forums.wynncraft.com/threads/%E2%98%95-jasmine-dragon-leaf-combat-requirement-lv60-community-war-lore-discord-lv-76.293650/)

