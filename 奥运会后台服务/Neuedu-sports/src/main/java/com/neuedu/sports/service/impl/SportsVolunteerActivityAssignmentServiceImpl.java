package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsVolunteerActivityAssignmentMapper;
import com.neuedu.sports.domain.SportsVolunteerActivityAssignment;
import com.neuedu.sports.service.ISportsVolunteerActivityAssignmentService;

/**
 * 志愿者管理-活动分配Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsVolunteerActivityAssignmentServiceImpl extends ServiceImpl<SportsVolunteerActivityAssignmentMapper, SportsVolunteerActivityAssignment> implements ISportsVolunteerActivityAssignmentService
{
    private final SportsVolunteerActivityAssignmentMapper sportsVolunteerActivityAssignmentMapper;

    /**
     * 查询志愿者管理-活动分配
     * 
     * @param zho 志愿者管理-活动分配主键
     * @return 志愿者管理-活动分配
     */
    @Override
    public SportsVolunteerActivityAssignment selectSportsVolunteerActivityAssignmentByZho(Long zho)
    {
        return sportsVolunteerActivityAssignmentMapper.selectSportsVolunteerActivityAssignmentByZho(zho);
    }

    /**
     * 查询志愿者管理-活动分配列表
     * 
     * @param sportsVolunteerActivityAssignment 志愿者管理-活动分配
     * @return 志愿者管理-活动分配
     */
    @Override
    public List<SportsVolunteerActivityAssignment> selectSportsVolunteerActivityAssignmentList(SportsVolunteerActivityAssignment sportsVolunteerActivityAssignment)
    {
        return sportsVolunteerActivityAssignmentMapper.selectSportsVolunteerActivityAssignmentList(sportsVolunteerActivityAssignment);
    }

    /**
     * 新增志愿者管理-活动分配
     * 
     * @param sportsVolunteerActivityAssignment 志愿者管理-活动分配
     * @return 结果
     */
    @Override
    public int insertSportsVolunteerActivityAssignment(SportsVolunteerActivityAssignment sportsVolunteerActivityAssignment)
    {
        sportsVolunteerActivityAssignment.setCreateTime(DateUtils.getNowDate());
        return sportsVolunteerActivityAssignmentMapper.insertSportsVolunteerActivityAssignment(sportsVolunteerActivityAssignment);
    }

    /**
     * 修改志愿者管理-活动分配
     * 
     * @param sportsVolunteerActivityAssignment 志愿者管理-活动分配
     * @return 结果
     */
    @Override
    public int updateSportsVolunteerActivityAssignment(SportsVolunteerActivityAssignment sportsVolunteerActivityAssignment)
    {
        sportsVolunteerActivityAssignment.setUpdateTime(DateUtils.getNowDate());
        return sportsVolunteerActivityAssignmentMapper.updateSportsVolunteerActivityAssignment(sportsVolunteerActivityAssignment);
    }

    /**
     * 批量删除志愿者管理-活动分配
     * 
     * @param zhos 需要删除的志愿者管理-活动分配主键
     * @return 结果
     */
    @Override
    public int deleteSportsVolunteerActivityAssignmentByZhos(Long[] zhos)
    {
        return sportsVolunteerActivityAssignmentMapper.deleteSportsVolunteerActivityAssignmentByZhos(zhos);
    }

    /**
     * 删除志愿者管理-活动分配信息
     * 
     * @param zho 志愿者管理-活动分配主键
     * @return 结果
     */
    @Override
    public int deleteSportsVolunteerActivityAssignmentByZho(Long zho)
    {
        return sportsVolunteerActivityAssignmentMapper.deleteSportsVolunteerActivityAssignmentByZho(zho);
    }
}
