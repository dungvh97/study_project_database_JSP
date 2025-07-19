# study_project_database_JSP

This is a school project for managing a milk tea shop using JSP (JavaServer Pages) and a MySQL database.

## Project Overview
A web-based management system for a milk tea shop, allowing management of customers, members, products, and orders, including payment and discount calculations.
Check file Present_database.pptx for more detail.

## Features
- **Customer Management:** Add, update, and view customers, including their membership and purchase history.
- **Member Management:** Add and update shop members, track their loyalty points (save_mark), and view member lists.
- **Product Management:** Add, update, and view products and their stock quantities.
- **Order Management:** Assign products to customers, record purchase quantities, and calculate total payment including shipping and discounts.
- **Discounts and Loyalty:** Members accumulate points with purchases, which can be redeemed for discounts.
- **Statistics:** View statistics such as total discounts given, top customers, and product sales rankings.

## Technology Stack
- **Backend:** Java (JSP/Servlets)
- **Frontend:** JSP pages with JSTL and custom CSS
- **Database:** MySQL (see `project_milkteamanagement.sql` for schema)
- **Build Tool:** Apache Ant (see `build.xml`)
- **IDE:** NetBeans (project files in `nbproject/`)

## Setup Instructions
1. **Database:**
   - Import `project_milkteamanagement.sql` into your MySQL server to create the required schema and tables.
   - Update database connection settings in JSP files if your MySQL credentials differ (default is user `root` with no password).

2. **Dependencies:**
   - Requires MySQL Connector/J (`mysql-connector-java-5.1.6.jar`) in the classpath. The project expects it in the `WEB-INF/lib` directory.

3. **Build & Run:**
   - Open the project in NetBeans (recommended) or use Ant to build (`ant build`) and deploy (`ant run`).
   - Deploy to a Java EE server (e.g., GlassFish).

4. **Usage:**
   - Access the main page (`home.jsp`) to navigate between customer, member, and product management.
   - Use the forms to add/update customers, members, and products.
   - Assign products to customers and calculate payments, including shipping and discounts for members.

## File Structure
- `database_test/web/`: JSP pages for UI and business logic.
- `database_test/src/java/model/`: Java model classes for data representation.
- `project_milkteamanagement.sql`: SQL schema and sample data.
- `build.xml`, `nbproject/`: Build and project configuration files.
