# dotnet e-commerce templates 
[![Grand](https://github.com/templates4/E-Commerce/actions/workflows/Grand.yml/badge.svg)](https://github.com/templates4/E-Commerce/actions/workflows/Grand.yml)
[![Kooboo](https://github.com/templates4/E-Commerce/actions/workflows/Kooboo.yml/badge.svg)](https://github.com/templates4/E-Commerce/actions/workflows/Kooboo.yml)
[![N2](https://github.com/templates4/E-Commerce/actions/workflows/N2.yml/badge.svg)](https://github.com/templates4/E-Commerce/actions/workflows/N2.yml)
[![Nop](https://github.com/templates4/E-Commerce/actions/workflows/Nop.yml/badge.svg)](https://github.com/templates4/E-Commerce/actions/workflows/Nop.yml)
[![Orchard](https://github.com/templates4/E-Commerce/actions/workflows/Orchard.yml/badge.svg)](https://github.com/templates4/E-Commerce/actions/workflows/Orchard.yml)
[![Piranha](https://github.com/templates4/E-Commerce/actions/workflows/Piranha.yml/badge.svg)](https://github.com/templates4/E-Commerce/actions/workflows/Piranha.yml)
[![Smartstore](https://github.com/templates4/E-Commerce/actions/workflows/Smartstore.yml/badge.svg)](https://github.com/templates4/E-Commerce/actions/workflows/Smartstore.yml)
[![VirtoCommerce](https://github.com/templates4/E-Commerce/actions/workflows/VirtoCommerce.yml/badge.svg)](https://github.com/templates4/E-Commerce/actions/workflows/VirtoCommerce.yml)

Cloud Front is a push button e-commerce template engine streamlining and accelerating the development of data-centric e-commerce applications with a service-based architecture. Whether you're building SQL Server or MySql applications, Cloud Front aims to simplify the development process and reduce maintenance costs by eliminating boilerplate code and adhering to best software design practices.

## Documentation and Tutorials

For comprehensive documentation and step-by-step tutorials, please refer to the Cloud Front Developer Guide available at [fronts.cloud/docs](https://fronts.cloud/docs). This valuable resource will guide you through the platform's features, functionalities, and recommended practices. Stay up to date with the latest features and releases by following our blog at [fronts.cloud/blog](https://fronts.cloud/blog).

## Demos  

The demos are available via Scott Weeden's k8s cluster through a [yarp reverse proxy](https://github.com/microsoft/reverse-proxy), and a template is available for download on the Visual Studio marketplace as "Cloudfront E-Commerce":
  1. https://harbor.fronts.cloud/nop        -- NopCommerce Template
  2. https://harbor.fronts.cloud/virto      -- Virto Commerce Template
  3. https://harbor.fronts.cloud/smart      -- SmartStore Template
  4. https://harbor.fronts.cloud/grand      -- Grand2 Template
  5. https://harbor.fronts.cloud/composite  -- Composite Template
  6. https://harbor.fronts.cloud/Umbraco    -- Umbraco Template

## Premium Support

We offer premium support packages at [fronts.cloud](https://fronts.cloud/), which includes the customized themes for by bu. This template provides advanced samples, additional features, and modules to enhance your development experience. Gain access to premium support and take advantage of the CloudFront templates by visiting our website for more information.

## Database Support

You'll want to consider the supported back-end infrastructure if deploying on premis and out-of-the-box payment processor compatibility for each platform.

| E-Commerce Platform                                                 | Database Support                  | Docker |
|---------------------------------------------------------------------|-----------------------------------|--------|
| [1. Nop](https://github.com/nopSolutions/nopCommerce)               | SqlServer, MySql, PostgresSQL     | Yes    |
| [2. Virto Commerce](https://github.com/VirtoCommerce/vc-platform)   | SqlServer, MySql, PostgresSQL     | Yes    |
| [3. SmartStore](https://github.com/smartstore/Smartstore)           | SqlServer, MySql, SqlLite         | Yes    |
| [4. Grand 2](https://github.com/grandnode/grandnode2)               | SqlServer, MySql, SqlCE           | Yes    |
| [5. Composite](https://github.com/Orckestra/C1-CMS-Foundation)      | SqlServer, MySql, PostgresSQL     | Yes    |
| [6. Umbraco](https://github.com/umbraco/Umbraco-CMS)                | SqlServer, MySql, SqlCE, MongoDb  | Yes    |

## Payment processors and cloud providers

| E-Commerce Platform                                      | Payment Processors                            | Cloud Providers        |
|----------------------------------------------------------|----------------------------------------------|-----------------------|
| [1. Nop](https://www.nopcommerce.com/docs)              | PayPal, Stripe, Authorize.Net, Braintree     | AWS, Azure, Google Cloud     |
| [2. Virto Commerce](https://virtocommerce.com/docs)   | Stripe, PayPal, Authorize.Net, Klarna         | AWS, Azure, Google Cloud     |
| [3. SmartStore](https://docs.smartstore.com)       | PayPal, Stripe, Braintree, PayU              | AWS, Azure, Google Cloud     |
| [4. Grand](https://grandnode.com/docs)                  | PayPal, Stripe, 2Checkout, Payza             | AWS, Azure, Google Cloud     |
| [5. Composite](https://docs.composite.net)      | Authorize.Net, PayPal, Klarna, Skrill        | AWS, Azure, Google Cloud     |
| [6. Umbraco](https://umbraco.com/documentation/)                | Adyen, Stripe, PayPal, Klarna                | AWS, Azure, Google Cloud     |

## Contributing

Have an E-commerce platform you want to add? Fork this repository and : 
  - Add the repository for the E-Commerce as a submodule under the [build](./build) directory. 
  - Add the template files as a submodule under the [templates](./templates) directory
  - Add the unit tests as a a submodule under the [test](./test) directory
  - Update the VSIX project addng the UI to configure the new platform options

Then submit a pull request into the next version branch 

## License

Cloud Front is a free and open-source project released under the MIT license. This license allows you to use the platform in commercial e-commerce applications without any restrictions. Enjoy the freedom to build and innovate with Cloud Front while benefiting from the advantages of an open-source ecosystem.

Begin your journey with Cloud Front and experience a platform that empowers developers and accelerates the development of your data-centric e-commerce applications.

