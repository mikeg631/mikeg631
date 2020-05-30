import java.io.Serializable;

public abstract class Request implements Serializable {
    public static final long serialVersionUID = 1L;

    private String requestType;

    public Request(String requestType) {
        this.requestType = requestType;
    }

    public String getRequestType() {
        return this.requestType;
    }
}