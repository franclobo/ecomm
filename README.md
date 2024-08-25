<a name="readme-top"></a>

<div align="center">


  <br/>

  <h3><b>Ecommerce Ruby</b></h3>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Ecommerce Ruby <a name="about-project"></a>



**Ecommerce Ruby** is a project that allows users to buy and sell products online. Users can create an account, add products to their cart, and make purchases. Sellers can create products, manage their inventory, and view sales reports. It uses PayPal for payment processing.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/es/">Ruby</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
    <li><a href="https://aws.amazon.com/es/free/?gclid=Cj0KCQjwrKu2BhDkARIsAD7GBovU0ZwfocaJS4hLTYG3TZYV208guo0lLnjsMjtJ_axYUpdCYF_FGj4aAkTEEALw_wcB&trk=04eba5e2-014a-4892-986d-6755e849510d&sc_channel=ps&ef_id=Cj0KCQjwrKu2BhDkARIsAD7GBovU0ZwfocaJS4hLTYG3TZYV208guo0lLnjsMjtJ_axYUpdCYF_FGj4aAkTEEALw_wcB:G:s&s_kwcid=AL!4422!3!648114154064!e!!g!!amazon%20s3!19685311841!149715855527&all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all">AWS S3</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **Paypal payments**
- **Admin authentication**
- **Ecommerce**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

Create a new file called `.env` in the root directory of the project and add the following environment variables:

```sh
PAYPAL_SANDBOX_USERNAME=your_paypal_client_id
PAYPAL_SANDBOX_PASSWORD=your_paypal_secret
PAYPAL_SANDBOX_SIGNATURE=your_paypal_signature
S3_ACCESS_KEY=your_s3_access_key
S3_SECRET_KEY=your_s3_secret_key
S3_BUCKET=your_s3_bucket
S3_REGION=your_s3_region
```

### Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone git@github.com:franclobo/ecomm.git
```

### Install

Install this project with:

```sh
  cd my-project
  bundle install
  rails db:drop db:create db:migrate db:seed
  rails console
  Admin.create(email: 'your@email.com', password: 'your_password', password_confirmation: 'your_password')
```

### Usage

To run the project, execute the following command:

```sh
  rails server
```

### Run tests

To run tests, run the following command:

```sh
  bin/rails test test/models/article_test.rb
```

### Deployment

You can deploy this project using:


```sh
  fly deploy
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Francisco Borja**

- GitHub: [franclobo](https://github.com/franclobo)
- X: [@Pancho2788](https://x.com/Pancho2788)
- LinkedIn: [francisco-borja-lobato](https://www.linkedin.com/in/francisco-borja-lobato/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Add tests**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project, give it a ⭐️!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thanks [Conner Jensen](https://www.youtube.com/@connerjensen8170) for his [tutorial](https://www.youtube.com/watch?v=hURUMwdCWuI&t=142s) to develop this app.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
