// this is what the vector syntax looks like -> https://letsmovesui.com/courses/3/modules/6/lesson/1
module testing::vectors {

    // Remove duplicates from a sorted vector using while loop
    public fun remove_duplicates(v: &mut vector<u64>) {

        let mut i = 0;
        while (i < vector::length(v)-1) {
            
            // if the current element is the same as the next element, remove the current element
            if (vector::borrow(v, i) == vector::borrow(v, i + 1)) {
                vector::remove(v, i);
            };

            i = i + 1;
        }
    }
    
    #[test]
    fun test_vector_remove_dups() {

        let mut v = vector[1,2,3,4,4];

        // call the remove_duplicates function
        remove_duplicates(&mut v);

        // Check if the duplicates are removed
        assert!(vector::length(&v) == 4, 1);
    }
}

