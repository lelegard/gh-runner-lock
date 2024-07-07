public class testjava {
    public static void main(String[] args) {
        System.out.printf("testjava: before loading DLL\n");
        System.load(System.getProperty("user.dir") + "\\testdll.dll");
        System.out.printf("testjava: success\n");
    }
}
