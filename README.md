# Bookshelf-Manager-Database
Bookshelf Manager is a database-driven application designed for book enthusiasts to effortlessly organize and access their extensive book collections.

Hi everyone! 👋

A few days ago, I had the idea to create a database to manage my ever-growing book collection. As a book enthusiast, my collection has reached a point where I need an application to easily query and organize it (yes, I admit I've bought duplicate books 📚). The goal is to develop an application that allows for easy data entry and retrieval. Here, I share the complete database script, and I'll be updating it as I develop the application. I've also included information about the three books I'm currently reading.


## Steps Taken to Create the Database

### 1. Designing the Data Model

In envisioning the database, I began by identifying key entities that would define its structure. These included Countries, Publishers, Genres, Authors, and Books. Establishing relationships between these entities, such as Foreign Keys, was pivotal for maintaining data integrity.

### 2. Crafting the Tables

Next, I translated the design into SQL scripts to bring the tables to life. Each table, representing a core entity, was meticulously defined with its columns and constraints.

### 3. Indexing for Efficiency

To optimize data retrieval, I strategically implemented indexes. I created indexes on pertinent columns, such as book titles and author names, to enhance search performance.

### 4. Injecting Sample Data

No database is complete without data, right?
### 5. Shaping Views

For a tailored perspective on the data, I crafted views. A notable example is the `ReadBooks` view, presenting a curated list of books that have already been enjoyed.

## Testing the Database

Now, let's run a test to retrieve information from the database. Execute the following SQL query:

```sql
SELECT
    Books.Title AS 'Book Title',
    Authors.Name AS 'Author Name',
    Countries.Country_Name AS 'Country',
    Publishers.Name AS 'Publisher',
    Books.Publication_Year AS 'Publication Year',
    Books.Page_Count AS 'Page Count',
    CASE
        WHEN Books.IsRead = 1 THEN 'Yes'
        ELSE 'No'
    END AS 'Is Read'
FROM
    Books
JOIN Authors ON Books.Author_ID = Authors.Author_ID
JOIN Countries ON Authors.Nationality_ID = Countries.Country_ID
JOIN Publishers ON Books.Publisher_ID = Publishers.Publisher_ID;


| Book Title                     | Author Name         | Country      | Publisher            | Publication Year  | Page Count | Is Read |
| ------------------------------ | ------------------- | ------------ | -------------------- | ----------------- | ---------- | ------- |
| Pensar Rápido, Pensar Despacio | Daniel Kahneman     | Palestine    | Penguin Random House | 2012              | 590        | No      |
| El Método Lean Startup         | Eric Ries           | United States| Editorial Deusto     | 2011              | 319        | No      |
| La Vaca Púrpura                | Seth Godin          | United States| Editorial Booket     | 2003              | 173        | No      |

