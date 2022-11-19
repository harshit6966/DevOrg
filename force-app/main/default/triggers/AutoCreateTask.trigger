trigger AutoCreateTask on Contact (before update )  {
    for(contact con : trigger.new){
      Task tsk = new Task();
      tsk.whoId=con.id;
      tsk.Priority = 'Normal';
      tsk.Subject = con.FirstName + con.Email;
      tsk.Status = 'Completed';
      tsk.ownerid= con.ownerid;
      insert tsk;
    }
}