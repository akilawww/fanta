class GameController < ApplicationController
    protect_from_forgery :except => [:postScore]
    def getChar # game側からjsonデータを取得
        id = params[:user_id]

        # SQL
        


        render :json => 
    end

    def postScore # ランキングデータの受信
        id = params[:id]
        logger.debug(id)
    end
end
