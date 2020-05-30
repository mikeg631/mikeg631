
public class NicknameRequest extends Request {
    private String name;

    public NicknameRequest(String name) {
        super("Nickname");
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

}