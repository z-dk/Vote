package vote.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import vote.bean.Vote;
import vote.bean.VoteExample;

public interface VoteMapper {
    long countByExample(VoteExample example);

    int deleteByExample(VoteExample example);

    int deleteByPrimaryKey(Integer voteId);

    int insert(Vote record);

    int insertSelective(Vote record);

    List<Vote> selectByExample(VoteExample example);
    
    List<Vote> selectByExampleWithOption(VoteExample example);

    Vote selectByPrimaryKey(Integer voteId);
    
    Vote selectByPrimaryKeyWithOption(Integer voteId);

    int updateByExampleSelective(@Param("record") Vote record, @Param("example") VoteExample example);

    int updateByExample(@Param("record") Vote record, @Param("example") VoteExample example);

    int updateByPrimaryKeySelective(Vote record);

    int updateByPrimaryKey(Vote record);
}