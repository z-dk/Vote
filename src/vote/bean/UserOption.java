package vote.bean;

public class UserOption {
    private Integer votedId;

    private Integer limitId;

    private Integer optionId;

    public Integer getVotedId() {
        return votedId;
    }

    public void setVotedId(Integer votedId) {
        this.votedId = votedId;
    }

    public Integer getLimitId() {
        return limitId;
    }

    public void setLimitId(Integer limitId) {
        this.limitId = limitId;
    }

    public Integer getOptionId() {
        return optionId;
    }

    public void setOptionId(Integer optionId) {
        this.optionId = optionId;
    }
}