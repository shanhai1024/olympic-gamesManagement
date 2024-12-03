package com.neuedu.sports.service.impl;
import com.neuedu.common.utils.SecurityUtils;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsVolunteerMapper;
import com.neuedu.sports.domain.SportsVolunteer;
import com.neuedu.sports.service.ISportsVolunteerService;

/**
 * 志愿者信息中心Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-13
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsVolunteerServiceImpl extends ServiceImpl<SportsVolunteerMapper, SportsVolunteer> implements ISportsVolunteerService
{
    private final SportsVolunteerMapper sportsVolunteerMapper;

    /**
     * 查询志愿者信息中心
     * 
     * @param id 志愿者信息中心主键
     * @return 志愿者信息中心
     */
    @Override
    public SportsVolunteer selectSportsVolunteerById(Long id)
    {
        return sportsVolunteerMapper.selectSportsVolunteerById(id);
    }

    /**
     * 查询志愿者信息中心列表
     * 
     * @param sportsVolunteer 志愿者信息中心
     * @return 志愿者信息中心
     */
    @Override
    public List<SportsVolunteer> selectSportsVolunteerList(SportsVolunteer sportsVolunteer)
    {
        return sportsVolunteerMapper.selectSportsVolunteerList(sportsVolunteer);
    }

    /**
     * 新增志愿者信息中心
     * 
     * @param sportsVolunteer 志愿者信息中心
     * @return 结果
     */
    @Override
    public int insertSportsVolunteer(SportsVolunteer sportsVolunteer)
    {
        sportsVolunteer.setCreateBy(SecurityUtils.getUsername());
        sportsVolunteer.setCreateTime(DateUtils.getNowDate());
        return sportsVolunteerMapper.insertSportsVolunteer(sportsVolunteer);
    }

    /**
     * 修改志愿者信息中心
     * 
     * @param sportsVolunteer 志愿者信息中心
     * @return 结果
     */
    @Override
    public int updateSportsVolunteer(SportsVolunteer sportsVolunteer)
    {
        sportsVolunteer.setUpdateBy(SecurityUtils.getUsername());
        sportsVolunteer.setUpdateTime(DateUtils.getNowDate());
        return sportsVolunteerMapper.updateSportsVolunteer(sportsVolunteer);
    }

    /**
     * 批量删除志愿者信息中心
     * 
     * @param ids 需要删除的志愿者信息中心主键
     * @return 结果
     */
    @Override
    public int deleteSportsVolunteerByIds(Long[] ids)
    {
        return sportsVolunteerMapper.deleteSportsVolunteerByIds(ids);
    }

    /**
     * 删除志愿者信息中心信息
     * 
     * @param id 志愿者信息中心主键
     * @return 结果
     */
    @Override
    public int deleteSportsVolunteerById(Long id)
    {
        return sportsVolunteerMapper.deleteSportsVolunteerById(id);
    }
}
