package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsVolunteerActivityAssignment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 志愿者管理-活动分配Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsVolunteerActivityAssignmentMapper extends BaseMapper<SportsVolunteerActivityAssignment>
{
    /**
     * 查询志愿者管理-活动分配
     * 
     * @param zho 志愿者管理-活动分配主键
     * @return 志愿者管理-活动分配
     */
    public SportsVolunteerActivityAssignment selectSportsVolunteerActivityAssignmentByZho(Long zho);

    /**
     * 查询志愿者管理-活动分配列表
     * 
     * @param sportsVolunteerActivityAssignment 志愿者管理-活动分配
     * @return 志愿者管理-活动分配集合
     */
    public List<SportsVolunteerActivityAssignment> selectSportsVolunteerActivityAssignmentList(SportsVolunteerActivityAssignment sportsVolunteerActivityAssignment);

    /**
     * 新增志愿者管理-活动分配
     * 
     * @param sportsVolunteerActivityAssignment 志愿者管理-活动分配
     * @return 结果
     */
    public int insertSportsVolunteerActivityAssignment(SportsVolunteerActivityAssignment sportsVolunteerActivityAssignment);

    /**
     * 修改志愿者管理-活动分配
     * 
     * @param sportsVolunteerActivityAssignment 志愿者管理-活动分配
     * @return 结果
     */
    public int updateSportsVolunteerActivityAssignment(SportsVolunteerActivityAssignment sportsVolunteerActivityAssignment);

    /**
     * 删除志愿者管理-活动分配
     * 
     * @param zho 志愿者管理-活动分配主键
     * @return 结果
     */
    public int deleteSportsVolunteerActivityAssignmentByZho(Long zho);

    /**
     * 批量删除志愿者管理-活动分配
     * 
     * @param zhos 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsVolunteerActivityAssignmentByZhos(Long[] zhos);
}
