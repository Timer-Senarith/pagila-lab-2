# Pagila Lab 2: Joins and Data Quality

Academic SQL work by Timer Senarith for ALY6420 at Northeastern University. This project uses the Pagila DVD rental database to explore relationships between tables and the effect of join choices on query results.

## Tools

PostgreSQL 16, Neon, and DBeaver.

## SQL file

[View Lab 2.sql](Lab%202.sql)

Portfolio numbering follows the three included SQL projects. This JOIN assignment is labelled Lab 3 in the course.

## Objective

Retrieve related customer and rental records, check for unmatched records, and explain how incorrect joins can distort reporting.

## Tasks

- Join customer, address, and city to retrieve customer names and addresses.
- Use LEFT JOIN and IS NULL to check for customers without payment records.
- Follow customer → rental → inventory → film to retrieve customer 130’s rental history in chronological order.
- Use FULL OUTER JOIN to check for films without inventory copies and inventory records without matching films.
- Explain suitable join types for rental histories, complete actor listings, and staff-table reconciliation.
- Diagnose a missing join condition that creates a Cartesian product.
- Explain how row-count comparisons can reveal unintended row multiplication.
- Provide a commented correction connecting rental to inventory and film.
- Discuss how inflated rental counts could mislead inventory decisions.

## Interpreting data quality checks

A film without inventory is not automatically a referential integrity violation. It may simply have no inventory copies recorded.

An inventory record referencing a nonexistent film would indicate a referential integrity problem and should be prevented by an enforced foreign key.

No verified result is reported here for the customer-payment or film-inventory checks. The queries demonstrate how to investigate these conditions without assuming that unmatched records exist or are absent.

## Analytical reasoning

Join types determine which records remain in the output. INNER JOIN returns matching records, LEFT JOIN can preserve all records from the starting table, and FULL OUTER JOIN can expose unmatched records on either side.

Correct join conditions also determine the meaning of each result row. Missing conditions can multiply unrelated records and inflate totals.

## Running the queries

1. Obtain the Pagila sample database distribution.
2. Create a PostgreSQL database locally or in Neon.
3. Load the schema before the sample data. Use psql where the supplied scripts require it.
4. Connect through DBeaver and open Lab 2.sql.
5. Execute each question separately and inspect the returned columns and row counts.

The corrected query in the critique section is commented out. Uncomment that example before running it.

## Skills demonstrated

Relational joins, multi-table navigation, unmatched-record checks, join selection, row-count reasoning, and query debugging.

## Author

Timer Senarith
