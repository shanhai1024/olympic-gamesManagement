package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsNews;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 新闻公告Service接口
 * 
 * @author neuedu
 * @date 2024-06-13
 */
public interface ISportsNewsService extends IService<SportsNews>
{
    /**
     * 查询新闻公告
     * 
     * @param id 新闻公告主键
     * @return 新闻公告
     */
    public SportsNews selectSportsNewsById(Long id);

    /**
     * 查询新闻公告列表
     * 
     * @param sportsNews 新闻公告
     * @return 新闻公告集合
     */
    public List<SportsNews> selectSportsNewsList(SportsNews sportsNews);

    /**
     * 新增新闻公告
     * 
     * @param sportsNews 新闻公告
     * @return 结果
     */
    public int insertSportsNews(SportsNews sportsNews);

    /**
     * 修改新闻公告
     * 
     * @param sportsNews 新闻公告
     * @return 结果
     */
    public int updateSportsNews(SportsNews sportsNews);

    /**
     * 批量删除新闻公告
     * 
     * @param ids 需要删除的新闻公告主键集合
     * @return 结果
     */
    public int deleteSportsNewsByIds(Long[] ids);

    /**
     * 删除新闻公告信息
     * 
     * @param id 新闻公告主键
     * @return 结果
     */
    public int deleteSportsNewsById(Long id);
}
