import java.io.Serializable;

public abstract class Response implements Serializable
{
    public static final long serialVersionUID = 2L;
    private String responseType;
    private boolean res;

    public Response() {

    }

    public Response(String responseType, boolean res) {
        this.responseType = responseType;
        this.res = res;
    }

    public String getResponseType() {
        return this.responseType;
    }

    public boolean getResponseStatus()
    {
        return this.res;
    }

}
