class Main {
    public static void main(String[] a) {
        System.out.println(new Multi().Calculate(10, "my string"));
    }
}
class Multi {
    public int Calculate(int num, string t) {
        int num_aux; string texto;

	while (num_aux < 10) {
		if (num_aux / 2)
			texto = "par";
		else
			texto = "impar";
		num_aux = num_aux + 1;
	}
	return texto;
    }
}
