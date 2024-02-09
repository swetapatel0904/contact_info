class Model
{
  String? txtName,txtMobile,txtEmail,image;
  Model(
      {
        required this.txtName,
        required this.txtMobile,
        required this.txtEmail,
        required this.image
      }
      );
  Model.maptoModel();
  factory Model.model(Map m1)
  {
    return Model(
        txtName: m1['txtName'],
        txtMobile: m1['txtMobile'],
        txtEmail: m1['txtEmail'],
        image: m1['image']
    );
  }
}