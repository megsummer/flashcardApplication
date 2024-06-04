package com.techelevator.model;

import java.util.List;
public class Cards {

    private int cardId;

    private String frontQuestion;

    private String backAnswer;

    private String cardImg;

    private int userId;

    private List<String> tags;

    public int getCardId() {
        return cardId;
    }

    public void setCardId(int cardId) {
        this.cardId = cardId;
    }

    public String getFrontQuestion() {
        return frontQuestion;
    }

    public void setFrontQuestion(String frontQuestion) {
        this.frontQuestion = frontQuestion;
    }

    public String getBackAnswer() {
        return backAnswer;
    }

    public void setBackAnswer(String backAnswer) {
        this.backAnswer = backAnswer;
    }

    public String getCardImg() {
        return cardImg;
    }

    public void setCardImg(String cardImg) {
        this.cardImg = cardImg;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

}


