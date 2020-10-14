import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gerenciamento_os_ntel/models/ServiceModel.dart';
import 'package:gerenciamento_os_ntel/util/Util.dart';
import 'package:gerenciamento_os_ntel/widgets/TitleLine.dart';

import '../util/Util.dart';


// ignore: must_be_immutable
class Details extends StatefulWidget {

  final ServiceModel serviceModel;
  final GlobalKey keyForm =  GlobalKey<FormState>();
  String oldSituation = "";

  Details(this.serviceModel);
  
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _getFAB(),
      appBar: AppBar(
        backgroundColor: MyColors.PRIMARY,
        bottom: PreferredSize(
          child: Container(
            color: MyColors.SECONDARY,
            height: 4.0,
          ),
          preferredSize: Size.fromHeight(4.0),
        ),
        title: Text("Detalhes"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: widget.keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: TitleLine("Dados do Cliente"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nome: ",
                      style: TextStyle(
                        color: MyColors.TITLE,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 5, bottom: 5),
                      child: Text(widget.serviceModel.name),
                    ),
                    Text(
                      "Código: ",
                      style: TextStyle(
                        color: MyColors.TITLE,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 5, bottom: 5),
                      child: Text(widget.serviceModel.code),
                    ),
                    
                    Text(
                      "Endereço: ",
                      style: TextStyle(
                        color: MyColors.TITLE,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 5,  bottom: 5),
                      child: Text(widget.serviceModel.address),
                    ),
                    
                    Text(
                      "Telefone: ",
                      style: TextStyle(
                        color: MyColors.TITLE,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 5,  bottom: 5),
                      child: Text(widget.serviceModel.phone),
                    ),

                    Text(
                      "PPPoE",
                      style: TextStyle(
                        color: MyColors.TITLE,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                      Container(
                      margin: EdgeInsets.only(left: 30, top: 5,  bottom: 5),
                      child: Text(widget.serviceModel.pppoe),
                      ),
                      Text(
                      "Senha",
                      style: TextStyle(
                        color: MyColors.TITLE,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                      Container(
                      margin: EdgeInsets.only(left: 30, top: 5,  bottom: 5),
                      child: Text(widget.serviceModel.password),
                      ),
                  ],
                ),
              ),
              
                
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: TitleLine("Dados da Os"),
              ),
          
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tipo: ",
                      style: TextStyle(
                        color: MyColors.TITLE,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 5, bottom: 5),
                      child: Text(widget.serviceModel.service),
                    ),
                        
                    Text(
                      "Observação: ",
                      style: TextStyle(
                        color: MyColors.TITLE,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 5, bottom: 5),
                      child: Text(widget.serviceModel.observation),
                    ),
                      
                
                    Text(
                      "Situação: ",
                      style: TextStyle(
                        color: MyColors.TITLE,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 5, bottom: 5),
                      child: Text(widget.serviceModel.situation),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getFAB() {
    return (widget.serviceModel.situation != "CONCLUÍDO" && widget.serviceModel.situation != "FEITO") ? SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: MyColors.SECONDARY,
      visible: true,
      curve: Curves.bounceIn,
      children: [
            
            SpeedDialChild(
            child: Icon(Icons.assignment_turned_in),
            backgroundColor: MyColors.SECONDARY,
            onTap: () async {
                String result = await widget.serviceModel.updateSituation(situation: "SEM CONTATO");
                if(result == Messages.NOT_CONECTION)
                    _snackBar(result, 0);
                setState((){});
            },
            label: 'SEM CONTATO',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: MyColors.SECONDARY),
            
            SpeedDialChild(
            child: Icon(Icons.assignment_turned_in),
            backgroundColor: MyColors.PRIMARY,
            onTap:()async{
              String description = "";
              showDialog(
                context: context,
                child: AlertDialog(
                  title: Center(child:Text("Descrição da OS")),
                  content: Form(
                    key: _formKey,
                    child:TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onChanged: (text)=>description=text,
                      validator: _validateDescription,
                    ),
                  ),
                  actions: [
                    FlatButton(
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                          String result = await widget.serviceModel.updateSituation(situation:"FEITO", description: description.trim());
                          if(result == Messages.NOT_CONECTION){
                            Navigator.pop(context);
                            _snackBar(result, 0);
                          }else{
                            widget.oldSituation = result;
                            Navigator.pop(context);
                            _snackBar("OS finalizada com sucesso", 0);
                          }  
                          setState(()  {});   
                        }
                      },
                      child: Text("Concluir"),),
                      FlatButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancelar",
                          style: TextStyle(
                            color: MyColors.SECONDARY
                          ),
                        ),
                      ),
                    ],
                  ),
                );       
              },
            label: 'FEITO',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: MyColors.PRIMARY)
      ],
    ):null;
  }

  String _validateDescription(String text){
    if(text.isEmpty)
      return "Este campo é obrigatório";
    return null;
  }

  _snackBar(String text, int type){
    Scaffold.of(widget.keyForm.currentContext).showSnackBar(
      SnackBar(
        elevation: 5,
        backgroundColor: MyColors.WRITE,
        action: type == 1 ? SnackBarAction(
          label: "Desfazer",
          onPressed: ()async{
              String result = await widget.serviceModel.updateSituation(situation: widget.oldSituation);
              if(result == Messages.NOT_CONECTION)
                  _snackBar(result, 0);
              setState(() {});
               
          },
          textColor: MyColors.SECONDARY,
        ) : null,
        content: Text(
          text,
          style: TextStyle(
            color: MyColors.PRIMARY,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
