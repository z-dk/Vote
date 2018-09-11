package vote.bean;

import java.util.Date;
import java.util.List;

public class Vote {
    @Override
	public String toString() {
		return "Vote [voteId=" + voteId + ", voteName=" + voteName + ", voteBrief=" + voteBrief + ", uId=" + uId
				+ ", voteType=" + voteType + ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}

	private Integer voteId;

    private String voteName;

    private String voteBrief;

    private Integer uId;

    private Integer voteType;

    private Date startTime;

    private Date endTime;
    
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

    public Integer getVoteType() {
        return voteType;
    }

    public void setVoteType(Integer voteType) {
        this.voteType = voteType;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
}