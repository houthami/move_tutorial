module 0x42::HelloWorldNetwork {
    //use std::debug;
    use std::vector;

    struct Friends has store, key, drop {
        people: vector<Person>
    }
    struct Person has store, key, drop, copy {
        name: vector<u8>,
        age: u8
    }

    public fun create_friend(my_friend: Person, friends: &mut Friends): Person {
        let newFriend = Person {
            name: my_friend.name,
            age: my_friend.age
        };
        add_friend(newFriend, friends);
        return newFriend
    }

    public fun add_friend(_person: Person, friends:&mut Friends){
        vector::push_back(&mut friends.people, _person);
    }

    /*public fun set_age(new_age: u8):u8 {
        let person = Person { age: new_age};
        person.age
    }*/

    #[test]
    fun test_create_friend(){
        let hassan = Person {
            name: b"hassan",
            age: 25,
        };
        let friends = Friends{
            people: (vector[hassan])
        };
        let createFriend = create_friend(hassan, &mut friends);
        assert!(createFriend.name == b"hassan", 0);
    }
}