global PRIME: u32 = 0x01000193;

fn main(value: u32, hash_value: pub u32){
    let calculated_hash_value = calculate_hash(value);

    assert(calculated_hash_value == hash_value);
}

fn calculate_hash(num: u32) -> u32 {
    let mut hash_value = 0x811C9DC5;
    for i in 0..4 {
        let product = hash_value * PRIME;
        let byte = ((num << (i * 8)) & 0xff000000) >> 24;
        hash_value = product ^ byte;
    }
    hash_value
}

#[test]
fn test_1() {
    let num = 127561628;
    let hash = calculate_hash(num);
    
    assert(hash == 0x71233de7);
}

#[test]
fn test_2() {
    let num = 237261828;
    let hash = calculate_hash(num);

    assert(hash == 0x7F51D567);
}

#[test]
fn test_3() {
    let num = 596214892;
    let hash = calculate_hash(num);

    assert(hash == 0x3F0C8995);
}
