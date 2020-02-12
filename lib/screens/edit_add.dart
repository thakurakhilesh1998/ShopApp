import 'package:flutter/material.dart';
import '../model/product.dart';
import 'package:provider/provider.dart';
import '../provider/products_package.dart';
class EditAdd extends StatefulWidget {
  static const EditAddRoute="/edit_add_route";
  @override
  _EditAddState createState() => _EditAddState();
}

class _EditAddState extends State<EditAdd> {
final focusNode=FocusNode();
final descriptionFocus=FocusNode();
final imageUrlController=TextEditingController();
final imageFocus=FocusNode();
final formKey=GlobalKey<FormState>();
var _isInit=true;
var editable=Product(
  id: null,
   title: "",
    price: 0.0,
     description: "",
      imageUrl: ""
  );
  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };
  @override
  void didChangeDependencies()
  {
    if(_isInit)
    {
      final productID=ModalRoute.of(context).settings.arguments as String;
      if(productID!=null)
      {
        editable=Provider.of<Products>(context,listen: false).getProductId(productID);
        _initValues={
          'title':editable.title,
          'description':editable.description,
          'price':editable.price.toString(),
          'imageUrl':'',
        };
        imageUrlController.text=editable.imageUrl;
      }
        _isInit=false;
    }
    super.didChangeDependencies();
  }
@override
void initState()
{
  imageFocus.addListener(updateImage);
  super.initState();
}
void updateImage()
{
if(!imageFocus.hasFocus)
{
  if((! imageUrlController.text.startsWith("http") && ! imageUrlController.text.startsWith("https"))
  || (! imageUrlController.text.endsWith("png") && ! imageUrlController.text.endsWith("jpg") 
  && ! imageUrlController.text.endsWith("gif")))
  {
    return;
  }
  setState(() {
  });
}
}
@override
void dispose()
{
  focusNode.dispose();
  descriptionFocus.dispose();
  imageUrlController.dispose();
  imageFocus.removeListener(updateImage);
  super.dispose();
}
void onFormSubmitted()
{
  final isValidate=formKey.currentState.validate();
  if(! isValidate)
  {
    return;
  }
formKey.currentState.save();
if(editable.id!=null)
{
  Provider.of<Products>(context).updateProduct(editable.id, editable);
}
else
{
Provider.of<Products>(context).addItem(editable);
}
}
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Order"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: ()
            {
              onFormSubmitted();
            },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _initValues['title'],
                decoration: const InputDecoration(labelText: "Title",
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_)
                {
                  FocusScope.of(context).requestFocus(focusNode);
                },
                onSaved: (value)=>editable=Product(
                  id: editable.id,
                  title: value,
                  price: editable.price, 
                  description: editable.description, 
                  imageUrl: editable.imageUrl,
                  isFavourite: editable.isFavourite),
                  validator: (value){
                    if(value.isEmpty)
                    {
                      return "enter a title";
                    } 
                    if(value.length<3)
                    {
                      return "Enter title more than 2 character";
                    }
                      return null;
                  },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(
                  labelText:"Price",
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode:focusNode,
                onFieldSubmitted: (_)
                {
                  FocusScope.of(context).requestFocus(descriptionFocus);
                },            
                 onSaved: (value)=>editable=Product(
                   id: editable.id,
                 title: editable.title,
                  price: double.parse(value), 
                  description: editable.description, 
                  imageUrl: editable.imageUrl,
                  isFavourite: editable.isFavourite,
                  ),
                  validator: (value){
                    if(value.isEmpty)
                    {
                      return "enter a price";
                    }
                    if(double.tryParse(value)==null)
                    {
                      return "enter a valid price";
                    }
                    if(double.parse(value)<0)
                    {
                      return "enter price more than 0";
                    }
                    return null;

                  },
              ),
              TextFormField(
                initialValue: _initValues['description'],
                decoration: InputDecoration(
                  labelText: "Description"
                ),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode:descriptionFocus,
                validator: (value)
                {
                  if(value.isEmpty)
                  {
                    return "enter description";
                  }
                  if(value.length<=10)
                  {
                    return "character must be more than 10";
                  }
                  return null;
                },
                 onSaved: (value)=>editable=Product(
                   id: editable.id,
                 title: editable.title,
                  price: editable.price, 
                  description: value, 
                  imageUrl: editable.imageUrl,
                  isFavourite: editable.isFavourite,)

              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 5,left: 5,top: 5),
                    decoration:BoxDecoration(
                      border: Border.all(width: 1,color: Colors.grey),
                      ) ,
                    width: 100,
                    height: 100,
                    child: imageUrlController.text.isEmpty ? Text("No Image!",textAlign: TextAlign.center,):
                    FittedBox(
                      child: Image.network(imageUrlController.text,
                      fit: BoxFit.cover,
                      ),
                    )
                  ),
                  Expanded(
                      child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "ImageUrl",
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.url,
                      controller:imageUrlController,
                      focusNode: imageFocus,
                       onSaved: (value)=>editable=Product(
                         id: editable.id,
                      title: editable.title,
                      price: editable.price, 
                      description: editable.description, 
                      imageUrl: value,
                      isFavourite: editable.isFavourite,),
                      validator: (value)
                      {
                        if(value.isEmpty)
                        {
                          return "image url can not be empty";
                        }
                        if(!value.startsWith("http") && !value.startsWith("https"))
                        {
                          return "enter valid image url";
                        }
                        if(!value.endsWith("png") && ! value.endsWith("jpg") && !value.endsWith("gif"))
                        {
                          return "enter valid image url";
                        }
                        return null;
                      },
                      onFieldSubmitted: (_)
                      {
                        onFormSubmitted();
                      },
                    ),
                  ),
                ],
              ),
            ],
            ),
            ),
      ),
    );
  }
}
