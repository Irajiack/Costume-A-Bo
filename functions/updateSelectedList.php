<?php
include('../config/config.php');

$GivenItems=array();
$GivenItems= json_decode($_POST['Costumes'], true);

if(empty($_POST['Costumes']))
{
    $GivenItems['Tai']= "neck";
    $GivenItems['Tai_Selected']= "81";
}

foreach ($GivenItems as $key => $SelectedKey) 
{
    if(stristr($key, '_Selected'))
    {
        $category = str_replace("_Selected", "", $key);
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
        ?>
        <div id="<?=$SelectedItem['ID']?>" data-id="<?=$SelectedItem['ID']?>" data-category="<?=$category?>" data-img="<?=$Event?><?=$SelectedItem['Outfit']?><?=$SelectedItem['Name']?>" class="draggable-element cursors-drag">  
            <img src="pictures/renderings/<?=$SelectedItem['Category']?>/<?=$Event?><?=$SelectedItem['Outfit']?><?=$SelectedItem['Name']?>_Icons.png" class="w-full rounded-t-xl" alt="<?=htmlentities($SelectedItem['Alt'], ENT_QUOTES, "UTF-8")?>">

            <div class="w-full bg-[#F7033C] cursors-pointer delete-clothe flex justify-center items-center p-2 rounded-b-xl border-t border-gray-950" tabindex="0" role="button" aria-pressed="false">
                <i class="fa-solid fa-trash-can text-xl m-0 text-Platinum"></i>
            </div>
        </div>
        <?php
    }
}

?>