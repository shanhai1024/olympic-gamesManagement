package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsVolunteerActivityAssignment;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 志愿者管理-活动分配Service接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
public interface ISportsVolunteerActivityAssignmentService extends IService<SportsVolunteerActivityAssignment>
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
     * 批量删除志愿者管理-活动分配
     * 
     * @param zhos 需要删除的志愿者管理-活动分配主键集合
     * @return 结果
     */
    public int deleteSportsVolunteerActivityAssignmentByZhos(Long[] zhos);

    /**
     * 删除志愿者管理-活动分配信息
     * 
     * @param zho 志愿者管理-活动分配主键
     * @return 结果
     */
    public int deleteSportsVolunteerActivityAssignmentByZho(Long zho);
}
