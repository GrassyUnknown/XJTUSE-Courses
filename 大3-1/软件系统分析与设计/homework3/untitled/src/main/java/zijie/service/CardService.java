package zijie.service;

import zijie.dao.CardDao;
import zijie.model.Card;

public class CardService {
    public static Card findCardByID(int idcard) {
        return CardDao.selectByID(idcard);
    }
    public static Card findCardByUser(int iduser) {
        return CardDao.selectByUserID(iduser);
    }
    public static int updateCard(Card card){
        return CardDao.update(card);
    }

    public static int deleteCard(Card findingCard) {
        return CardDao.delete(findingCard);
    }
}
