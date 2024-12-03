package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsNews;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 新闻公告Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-13
 */
@Mapper
public interface SportsNewsMapper extends BaseMapper<SportsNews>
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
     * 删除新闻公告
     * 
     * @param id 新闻公告主键
     * @return 结果
     */
    public int deleteSportsNewsById(Long id);

    /**
     * 批量删除新闻公告
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsNewsByIds(Long[] ids);
}
