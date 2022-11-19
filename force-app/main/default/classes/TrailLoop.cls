public class TrailLoop {
    //Here is a combined problem of a query that needs a filter
    //and a loop that continually calls out to the database
    public static void AllGoodThings(Account a) {
        List<Task> allMyTasks = [Select Id, Status, WhatId From Task WHERE WhatId =: a.Id];
        List<Task> taskList = new List<Task>();
        for (Task t : allMyTasks) {
            t.status = 'Completed';
            taskList.add(t);
        }
        update taskList;
    }
}