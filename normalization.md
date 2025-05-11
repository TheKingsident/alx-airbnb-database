Payment method from the Paynment table can be normalized into its opwn table rather than remain as an ENUM. For example

## PaymentMethod
- **payment_method_id**: Primary key, UUID
- **name**: `VARCHAR`, UNIQUE, NOT NULL

Same goes for user role from the user table:

## UserRole
- **role_id**: Primary key,
- **name**: `VARCHAR`, UNIQUE, NOT NULL

Property Location needs to be normalized as well else we will have duplicates. This will also be monumental in ensuring we can filter queries by location:

# Location
- **location_id**: Primary key, UUID
- **city**: `VARCHAR`, NOT NULL
- **state**: `VARCHAR`, NOT NULL
- **country**: `VARCHAR`, NOT NULL
We will then reference location_id in the Property table