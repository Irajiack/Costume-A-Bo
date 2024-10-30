<?php
include('../config/config.php');
$Base_File_Path='pictures/renderings';

$BoBase="base";

$GivenItems=array();
$GivenItems= json_decode($_POST['Costumes'], true);

$Items=array();

if(isset($GivenItems['Backgrounds']))
{
    if(!isset($GivenItems['Backgrounds']) || empty($GivenItems['Backgrounds']))
    {
        $Items[]="pictures/none.png";
    }
    else
    {
        $Items[]="".$Base_File_Path."/Backgrounds/".$GivenItems['Backgrounds'].".png";
    }
}

foreach ($GivenItems as $key => $Key) 
{
    if(stristr($key,'_Selected'))
    {
        $AddingItem = $bdd->prepare('SELECT * FROM Assets WHERE ID=:ID');
        $AddingItem->execute([":ID" => $GivenItems[$key]]);
        $SelectedItem= $AddingItem->fetch();
        if(!empty($SelectedItem['Event']))
        {
            $Event=$SelectedItem['Event']."/";
        }
        else
        {
            $Event="";
        }
        if($SelectedItem['BackPiece'] == true)
        {
            $Items[]="".$Base_File_Path."/".$SelectedItem['Category']."/".$Event."".$SelectedItem['Outfit']."".$SelectedItem['Name']."_Back.png";
        }
    }
}

$Items[]="".$Base_File_Path."/".$BoBase.".png";

foreach ($GivenItems as $key => $Key) 
{
    if($key !== "Backgrounds" && !stristr($key,'_Selected') && !stristr($key,'nbr'))
    {
        if(stristr($key,'Accessories'))
        {
            $category="Accessories";
        }
        elseif(stristr($key,'Makeup'))
        {
            $category="Makeup";
        }
        else 
        {
            $category=$key;
        }
        
        $Items[]="".$Base_File_Path."/".$category."/".$GivenItems[$key].".png";
    }
}

echo json_encode($Items, JSON_PRETTY_PRINT); 
?>
