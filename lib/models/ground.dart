class Ground {
  String name;
  String img;
  String incharge;
  List<String> equipments;

  Ground(
    this.name, 
    {
      this.img = "assets/imgs/ground1.jpg", 
      this.incharge = "Jindal Hector",
      this.equipments = const ["Badminton", "Ball", "Football", "Bat"],
    }
  );
}
