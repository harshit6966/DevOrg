public class SIContoller {
    Integer principal;
    Integer rate;
    Integer tiime;
    Integer simint;
    
    public SIContoller(){
        principal = rate = tiime = simint = 0;
    }
    
    public void setPrincipal(Integer p){
        principal = p;
    }
    
     public void setRate(Integer r){
        rate = r;
    }
    
     public void setTiime(Integer t){
        tiime = t;
    }
    
     public void setSimint(Integer si){
        simint = si;
    }
    
    public void calculate(){
        simint = principal * rate * tiime;
    }
    
    public Integer getPrincipal(){
        return principal;
    }
    
    public Integer getRate(){
        return rate;
    }
    
    public Integer getTiime(){
        return tiime;
    }
    
    public Integer getSimint(){
        return simint;
    }
}