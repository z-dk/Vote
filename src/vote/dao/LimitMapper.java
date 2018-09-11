package vote.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import vote.bean.Limit;
import vote.bean.LimitExample;

public interface LimitMapper {
    long countByExample(LimitExample example);

    int deleteByExample(LimitExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Limit record);

    int insertSelective(Limit record);

    List<Limit> selectByExample(LimitExample example);
    
    List<Limit> selectByExampleWithOption(LimitExample example);

    Limit selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Limit record, @Param("example") LimitExample example);

    int updateByExample(@Param("record") Limit record, @Param("example") LimitExample example);

    int updateByPrimaryKeySelective(Limit record);

    int updateByPrimaryKey(Limit record);
}