package com.neuedu.sports.service.impl;
import com.neuedu.common.utils.SecurityUtils;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsNewsMapper;
import com.neuedu.sports.domain.SportsNews;
import com.neuedu.sports.service.ISportsNewsService;

/**
 * 新闻公告Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-13
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsNewsServiceImpl extends ServiceImpl<SportsNewsMapper, SportsNews> implements ISportsNewsService
{
    private final SportsNewsMapper sportsNewsMapper;

    /**
     * 查询新闻公告
     * 
     * @param id 新闻公告主键
     * @return 新闻公告
     */
    @Override
    public SportsNews selectSportsNewsById(Long id)
    {
        return sportsNewsMapper.selectSportsNewsById(id);
    }

    /**
     * 查询新闻公告列表
     * 
     * @param sportsNews 新闻公告
     * @return 新闻公告
     */
    @Override
    public List<SportsNews> selectSportsNewsList(SportsNews sportsNews)
    {
        return sportsNewsMapper.selectSportsNewsList(sportsNews);
    }

    /**
     * 新增新闻公告
     * 
     * @param sportsNews 新闻公告
     * @return 结果
     */
    @Override
    public int insertSportsNews(SportsNews sportsNews)
    {
        sportsNews.setCreateBy(SecurityUtils.getUsername());
        sportsNews.setCreateTime(DateUtils.getNowDate());
        return sportsNewsMapper.insertSportsNews(sportsNews);
    }

    /**
     * 修改新闻公告
     * 
     * @param sportsNews 新闻公告
     * @return 结果
     */
    @Override
    public int updateSportsNews(SportsNews sportsNews)
    {
        sportsNews.setUpdateBy(SecurityUtils.getUsername());
        sportsNews.setUpdateTime(DateUtils.getNowDate());
        return sportsNewsMapper.updateSportsNews(sportsNews);
    }

    /**
     * 批量删除新闻公告
     * 
     * @param ids 需要删除的新闻公告主键
     * @return 结果
     */
    @Override
    public int deleteSportsNewsByIds(Long[] ids)
    {
        return sportsNewsMapper.deleteSportsNewsByIds(ids);
    }

    /**
     * 删除新闻公告信息
     * 
     * @param id 新闻公告主键
     * @return 结果
     */
    @Override
    public int deleteSportsNewsById(Long id)
    {
        return sportsNewsMapper.deleteSportsNewsById(id);
    }
}
