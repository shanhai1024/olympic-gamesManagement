package com.neuedu.sports.api;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.neuedu.common.annotation.Anonymous;
import com.neuedu.common.core.controller.BaseController;
import com.neuedu.common.core.domain.AjaxResult;
import com.neuedu.common.core.page.TableDataInfo;
import com.neuedu.sports.domain.SportsFeedback;
import com.neuedu.sports.domain.SportsNews;
import com.neuedu.sports.domain.SportsVolunteer;
import com.neuedu.sports.service.ISportsFeedbackService;
import com.neuedu.sports.service.ISportsNewsService;
import com.neuedu.sports.service.ISportsVolunteerService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Author: sunCC
 * Date: 2024/6/13
 * 前端接口
 */
@RestController
@RequestMapping("/api")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class ApiController extends BaseController {

    private final ISportsNewsService newsService;

    private final ISportsVolunteerService volunteerService;

    private final ISportsFeedbackService feedbackService;

    /**
     * 查询新闻公告信息
     */
    @GetMapping("/news/list")
    public TableDataInfo getNews(SportsNews sportsNews){
        startPage();
        List<SportsNews> news = newsService.selectSportsNewsList(sportsNews);
        return getDataTable(news);
    }

    /**
     * 获取新闻公告详情
     */
    @GetMapping("/news/{id}")
    public AjaxResult getNewsDetail(@PathVariable("id") Long id) {
        SportsNews news = newsService.selectSportsNewsById(id);
        return AjaxResult.success(news);
    }

    @PutMapping("/news/view")
    public AjaxResult newsView(@RequestBody SportsNews sportsNews){
        UpdateWrapper<SportsNews> update = new UpdateWrapper<>();
        update.setSql("views = views + 1");
        update.eq("id",sportsNews.getId());
        return AjaxResult.success(newsService.update(update));
    }

    /**
     * 查询志愿者信息中心
     */
    @GetMapping("/volunteer/list")
    public TableDataInfo getVolunteer(SportsVolunteer sportsVolunteer) {
        startPage();
        List<SportsVolunteer> volunteer = volunteerService.selectSportsVolunteerList(sportsVolunteer);
        return getDataTable(volunteer);
    }

    /**
     * 获取志愿者信息中心信息详情
     */
    @GetMapping("/volunteer/{id}")
    public AjaxResult getVolunteerDetail(@PathVariable("id") Long id) {
        SportsVolunteer volunteer = volunteerService.selectSportsVolunteerById(id);
        return AjaxResult.success(volunteer);
    }

    @PutMapping("/volunteer/view")
    public AjaxResult volunteerView(@RequestBody SportsVolunteer sportsVolunteer){
        UpdateWrapper<SportsVolunteer> update = new UpdateWrapper<>();
        update.setSql("views = views + 1");
        update.eq("id",sportsVolunteer.getId());
        return AjaxResult.success(volunteerService.update(update));
    }

    /**
     * 查询用户反馈列表
     */
    @GetMapping("/feedback/list")
    public TableDataInfo getFeedback(SportsFeedback sportsFeedback) {
        startPage();
        sportsFeedback.setUserId(getUserId());
        List<SportsFeedback> feedback = feedbackService.selectSportsFeedbackList(sportsFeedback);
        return getDataTable(feedback);
    }

    /**
     * 添加查询用户反馈
     */
    @PostMapping("/feedback")
    public AjaxResult add(@RequestBody SportsFeedback sportsFeedback)
    {
        sportsFeedback.setUserId(getUserId());
        return toAjax(feedbackService.insertSportsFeedback(sportsFeedback));
    }

    /**
     * 获取用户反馈
     */
    @GetMapping("/feedback/{id}")
    public AjaxResult getFeedbackDetail(@PathVariable("id") Long id) {
        SportsFeedback feedback = feedbackService.selectSportsFeedbackById(id);
        return AjaxResult.success(feedback);
    }

}
