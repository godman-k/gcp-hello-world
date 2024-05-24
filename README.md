# gcp-hello-world
Deploying Hello World with Terraform in GCP

# README.md
# Hello World Web Application

This is a simple "Hello World" web application deployed on the Google Cloud Platform (GCP) Free Tier. The application retrieves a "Hello World" message from a Cloud SQL database and displays it through a web browser.

## Architecture

The application is built using the following components:

- **Web Application**: A Python Flask application running on a Google Compute Engine instance.
- **Database**: A Cloud SQL PostgreSQL instance storing the "Hello World" message.
- **Load Balancer**: A Google Cloud Load Balancer distributing traffic across multiple web application instances.
- **CDN**: Google Cloud CDN for caching static content and improving performance.
- **Monitoring**: Google Cloud Operations for monitoring application and infrastructure metrics.

## Deployment

The infrastructure and application are deployed using Infrastructure as Code (IaC) with Terraform. The Terraform configuration files are located in the `terraform/` directory.

To deploy the application, follow these steps:

1. Install Terraform and the Google Cloud SDK.
2. Authenticate with your GCP account: `gcloud auth login`
3. Initialize Terraform: `terraform init`
4. Review the execution plan: `terraform plan`
5. Apply the changes: `terraform apply`

## Monitoring

The application is monitored using Google Cloud Operations. The following metrics are tracked:

- **CPU and Memory Utilization**: To identify resource constraints.
- **Request Latency and Error Rates**: To monitor application performance and user experience.
- **Database Performance**: To detect potential bottlenecks or issues with data access.

## Contributing

If you find any issues or have suggestions for improvement, please open an issue or submit a pull request.
