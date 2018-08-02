package vote.bean;

import java.util.List;

public class Vote {
    private Integer voteId;

    private String voteName;

    private String voteBrief;

    private Integer uId;
    
    private List<Option> options;

	public List<Option> getOptions() {
		return options;
	}

	public void setOptions(List<Option> options) {
		this.options = options;
	}

	public Integer getVoteId() {
        return voteId;
    }

    public void setVoteId(Integer voteId) {
        this.voteId = voteId;
    }

    public String getVoteName() {
        return voteName;
    }

    public void setVoteName(String voteName) {
        this.voteName = voteName;
    }

    public String getVoteBrief() {
        return voteBrief;
    }

    public void setVoteBrief(String voteBrief) {
        this.voteBrief = voteBrief;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }
}