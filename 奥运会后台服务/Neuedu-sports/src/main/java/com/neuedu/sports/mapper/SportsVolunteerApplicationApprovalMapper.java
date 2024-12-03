package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsVolunteerApplicationApproval;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 志愿者管理-申请与审批Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsVolunteerApplicationApprovalMapper extends BaseMapper<SportsVolunteerApplicationApproval>
{
    /**
     * 查询志愿者管理-申请与审批
     * 
     * @param id 志愿者管理-申请与审批主键
     * @return 志愿者管理-申请与审批
     */
    public SportsVolunteerApplicationApproval selectSportsVolunteerApplicationApprovalById(Long id);

    /**
     * 查询志愿者管理-申请与审批列表
     * 
     * @param sportsVolunteerApplicationApproval 志愿者管理-申请与审批
     * @return 志愿者管理-申请与审批集合
     */
    public List<SportsVolunteerApplicationApproval> selectSportsVolunteerApplicationApprovalList(SportsVolunteerApplicationApproval sportsVolunteerApplicationApproval);

    /**
     * 新增志愿者管理-申请与审批
     * 
     * @param sportsVolunteerApplicationApproval 志愿者管理-申请与审批
     * @return 结果
     */
    public int insertSportsVolunteerApplicationApproval(SportsVolunteerApplicationApproval sportsVolunteerApplicationApproval);

    /**
     * 修改志愿者管理-申请与审批
     * 
     * @param sportsVolunteerApplicationApproval 志愿者管理-申请与审批
     * @return 结果
     */
    public int updateSportsVolunteerApplicationApproval(SportsVolunteerApplicationApproval sportsVolunteerApplicationApproval);

    /**
     * 删除志愿者管理-申请与审批
     * 
     * @param id 志愿者管理-申请与审批主键
     * @return 结果
     */
    public int deleteSportsVolunteerApplicationApprovalById(Long id);

    /**
     * 批量删除志愿者管理-申请与审批
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsVolunteerApplicationApprovalByIds(Long[] ids);
}
