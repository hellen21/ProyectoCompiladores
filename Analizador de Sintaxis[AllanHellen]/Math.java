class Main {
    public static void main(String[] a) {
        System.out.println(new Math().Square(10));
    }
}
class Math {
    public int PlusOne(int num) {
        return num + 1;
    }

    public int MinusOne(int num) {
	return num - 1;
    }

    public int Square(int num) {
	return num * num;
    }
}
