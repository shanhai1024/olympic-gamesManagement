package com.neuedu.zyzxx.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.zyzxx.mapper.SportsVolunteerMapper1;
import com.neuedu.zyzxx.domain.SportsVolunteer1;
import com.neuedu.zyzxx.service.ISportsVolunteerService1;

/**
 * 志愿者信息中心Service业务层处理
 *
 * @author ruoyi
 * @date 2024-11-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsVolunteerServiceImpl1 extends ServiceImpl<SportsVolunteerMapper1, SportsVolunteer1> implements ISportsVolunteerService1
{
    private final SportsVolunteerMapper1 sportsVolunteerMapper;

    /**
     * 查询志愿者信息中心
     *
     * @param id 志愿者信息中心主键
     * @return 志愿者信息中心
     */
    @Override
    public SportsVolunteer1 selectSportsVolunteerById(Long id)
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
    public List<SportsVolunteer1> selectSportsVolunteerList(SportsVolunteer1 sportsVolunteer)
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
    public int insertSportsVolunteer(SportsVolunteer1 sportsVolunteer)
    {
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
    public int updateSportsVolunteer(SportsVolunteer1 sportsVolunteer)
    {
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
