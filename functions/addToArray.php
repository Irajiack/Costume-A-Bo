<?php
include('../config/config.php');

$Items=array();
$Items= json_decode($_POST['Costumes'], true);
$AllreadyAddedAccessories=0;
$AllreadyAddedMakeup=0;

$Accessories=number_format(htmlentities($_POST['nbrAccessories'], ENT_QUOTES, "UTF-8"));
$AccessoriesCheck=number_format(htmlentities($_POST['nbrAccessories'], ENT_QUOTES, "UTF-8")) - 1;

$Makeup=number_format(htmlentities($_POST['nbrMakeup'], ENT_QUOTES, "UTF-8"));
$MakeupCheck=number_format(htmlentities($_POST['nbrMakeup'], ENT_QUOTES, "UTF-8")) - 1;

$AddingItem = $bdd->prepare('SELECT * FROM Assets WHERE ID=:ID');
$AddingItem->execute([":ID" => $_POST['ID']]);
$SelectedItem= $AddingItem->fetch();

$Items['nbrMakeup']="None";
$Items['nbrAccessories']="None";

if(!empty($SelectedItem['Event']))
{
    $Event=$SelectedItem['Event']."/";
}
else
{
    $Event="";
}

if($SelectedItem['Category'] == "Accessories")
{
    while($AccessoriesCheck >= 0)
    {
        if(isset($Items["Accessories_".$AccessoriesCheck."_Selected"]) && $Items["Accessories_".$AccessoriesCheck."_Selected"] == $SelectedItem['ID'])
        {
            $AllreadyAddedAccessories=1;
        }
        $AccessoriesCheck--;
    }
    if($AllreadyAddedAccessories == 0)
    {
        $Accessories="Accessories_".$Accessories."";
        $Items[$Accessories]="".$Event."".$SelectedItem['Outfit']."".$SelectedItem['Name']."";
        $Items[$Accessories."_Selected"]=$SelectedItem['ID'];
        $Items['nbrAccessories']="Yes";
    }
}
elseif($SelectedItem['Category'] == "Makeup")
{
    while($MakeupCheck >= 0)
    {
        if(isset($Items["Makeup_".$MakeupCheck."_Selected"]) && $Items["Makeup_".$MakeupCheck."_Selected"] == $SelectedItem['ID'])
        {
            $AllreadyAddedMakeup=1;
        }
        $MakeupCheck--;
    }
    if($AllreadyAddedMakeup == 0)
    {
        $Makeup="Makeup_".$Makeup."";
        $Items[$Makeup]="".$Event."".$SelectedItem['Outfit']."".$SelectedItem['Name']."";
        $Items[$Makeup."_Selected"]=$SelectedItem['ID'];
        $Items['nbrMakeup']="Yes";
    }
}
else
{
    $Items[$SelectedItem['Category']]="".$Event."".$SelectedItem['Outfit']."".$SelectedItem['Name']."";
    $Items[$SelectedItem['Category']."_Selected"]=$SelectedItem['ID'];
}



echo json_encode($Items); 
?>