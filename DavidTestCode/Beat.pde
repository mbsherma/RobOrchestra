public class Beat{
   
   //These should probably be private, but I'll leave them as public for convenience
   public int nsubbeats; //Number of subbeats we're "supposed" to have
   public ArrayList<Note>[] notes;
   public ArrayList<Note>[] earlynotes;
   public ArrayList<String>[] notetext;
   public boolean forcedTonic;
   ArrayList<OutputTuple> output;
   
   public Beat(){
       nsubbeats = 1;
       notes = new ArrayList[1];
       notes[0] = new ArrayList<Note>();
       earlynotes = new ArrayList[1];
       earlynotes[0] = new ArrayList<Note>();
       getTextFromNotes();
       forcedTonic = false;
       output = new ArrayList();
       return;
   }
   public Beat(int n, ArrayList<Note>[] nnotes){
       nsubbeats = n;
       notes = nnotes;
       earlynotes = new ArrayList[1];
       earlynotes[0] = new ArrayList<Note>();
       getTextFromNotes();
       forcedTonic = false;
       output = new ArrayList();
       return;
   }
   public Beat(int n, ArrayList<Note>[] nnotes, ArrayList<Note>[] nenotes){
       nsubbeats = n;
       notes = nnotes;
       earlynotes = nenotes;
       getTextFromNotes();
       forcedTonic = false;
       output = new ArrayList();
       return;
   }
   public Beat(int n, ArrayList<Note>[] nnotes, ArrayList<Note>[] nenotes, ArrayList<String>[] nnotetext){
       nsubbeats = n;
       notes = nnotes;
       earlynotes = nenotes;
       notetext = nnotetext;
       forcedTonic = false;
       output = new ArrayList();
       return;
   }
   
   //Basically just a copy function
   public Beat(Beat b){
      nsubbeats = b.nsubbeats;
      notes = b.notes;
      earlynotes = b.earlynotes;
      notetext = b.notetext;
      forcedTonic = b.forcedTonic;
      output = b.output;
      return;
   }
   
   public void getTextFromNotes(){
      notetext = new ArrayList[notes.length];
      for(int x = 0; x < notes.length; x++){
          notetext[x] = new ArrayList<String>();
          for(int y = 0; y < notes[x].size(); y++){
             notetext[x].add("" + notes[x].get(y).pitch()); 
          }
          for(int y = 0; y < earlynotes[x].size(); y++){
             notetext[x].add("" + earlynotes[x].get(y).pitch()); 
          }
      }
   }
   public void addOutput(String s, int i){
    output.add(new OutputTuple(s, i));
  }
}