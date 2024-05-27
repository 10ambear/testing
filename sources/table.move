module testing::table {
    /// Imported from the `sui::table` module.
    use sui::table::{Self, Table};
    

    /// Some record type with `store`
    public struct Record has store { /* ... */ }

    /// An example of a `Table` as a struct field.
    public struct UserRegistry has key {
        id: UID,
        table: Table<address, Record>
    }

    #[test] fun test_table() {
    use std::string::{String};
    
    let ctx = &mut tx_context::dummy();

    // Table requires explicit type parameters for the key and value
    // ...but does it only once in initialization.
    let mut table = table::new<address, String>(ctx);

    // table has the `length` function to get the number of elements
    assert!(table.length() == 0, 0);

    table.add(@0xa11ce, b"my_value".to_string());
    table.add(@0xb0b, b"another_value".to_string());

    // length has changed to 2
    assert!(table.length() == 2, 2);
    
    // removing both values
    let _addr = table.remove(@0xa11ce);
    let _addr = table.remove(@0xb0b);

    // length is back to 0 - we can unpack
    table.destroy_empty();

    }


}