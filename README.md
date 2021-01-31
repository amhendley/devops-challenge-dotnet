# DevOps Challenge (.NET)

## Introduction

This challenge utilises the broad range of skills required by a DevOps Engineer. It focuses on DevOps for a .NET 5 application.

In completing the challenge, you're welcome to change all aspects of the initial repository, including:
* Directory and file structure.
* Solution and project names.
* Namespaces and class names.
* Code, data, and settings files.
* NuGet packages and dependencies.
* This README!

The solution should represent best practices, even if the starting solution is lacking them.

You'll need .NET 5 and SQL Server Local DB to build and run the application locally. On a Mac or Linux device, you can update the connection string and use Docker to launch SQL Server Developer Edition.

## Scenario

You're a DevOps Engineer working in a small team to launch a new application. The management team will use the new application to view and report on daily sales data.

The development team have built a new API to ingest sales data from an existing system and provide endpoints for viewing and reporting the data. A future application will provide a user interface.

*Note: For simplicity of the solution, the API does not require authentication. Don't do this in a real application!*

## Challenge

You should:

1. Introduce best practices into the solution to ensure a high-quality deliverable and a great developer experience.

2. Build and package the application as a container in a CI/CD pipeline ready for deployment

*Note: This challenge does NOT require infrastructure provisioning or deployment. This challenge has designed to be possible without incurring any licencing, hosting or tooling costs.*

You'll need to select a CI/CD tool to complete the challenge. Feel free to use your preferred platform, such as GitHub Actions, Azure Pipelines, Circle CI, or Travis CI.

*Note: Your repository and CI/CD pipeline will need to be public for review.*

## Opportunities

You've received feedback on the application from members of the project team. Optionally, fix these issues, or provide instructions back to the developer on the next steps to take:

1. The front end developer consuming the Sales API has mentioned the Swagger UI interface doesn't contain text descriptions of operations, parameters, or responses. They need assistance to understand the purpose and structure of the API.

2. The security team have identified the application is revealing the technology used by sending the response header `Server: Kestrel`. This header should not be present.

3. The database administrator has identified poor query performance when a sale record is retrieved using its transaction ID.

## Effort

Spend as much or as little time as you like on this challenge. DevOps Engineers wear many hats, and there's always more opportunity for change and improvement. Limit yourself to the time you have, and the changes that deliver the most value.

If you're looking for inspiration of changes to make, consider:

* Getting started documentation for a new developer.
* Configuring Git's behaviour for particular files.
* Versioning or artifacts.
* Linting and code quality analysis.
* Scanning for code vulnerabilities.
* Running unit tests.
* Assessing code coverage.
* Indexing PDBs for debugging in a deployed environment.
* Preparing to run integration tests on a deployed environment.
* Preparing to deploy database schema migrations.
* Generating a client for the API.

There's always more to learn and do. You don't need to do all of these to demonstrate your ability. Be kind to yourself, and enjoy the challenge.
