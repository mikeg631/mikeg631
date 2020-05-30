public class ReviewResponse extends Response
 {
    private String contest;

    public ReviewResponse(boolean res, String contest) {
        super("Review", res);
        this.contest = contest;
    }

    public String getReview() {
        return this.contest;
    }
}