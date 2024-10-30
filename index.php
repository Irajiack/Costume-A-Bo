<?php
include('includes/header.php');
$Base_File_Path='pictures/renderings';
?>
<div class="flex flex-col xl:grid xl:grid-cols-12 xl:gap-4 max-h-full h-full w-screen px-4">
    <div class="col-span-12 xl:col-span-6 max-h-max">
        <div ID="MainCanvasContainer"  class="w-full lg:w-10/12 xl:w-full">
            <canvas ID="MainCanvas" class="mx-auto rounded-2xl"></canvas>
            <canvas ID="HiddenCanvas" width="1200px" height="800px" class="hidden"></canvas>
        </div>
        <div id="downloadBtn" tabindex="0" role="button" aria-pressed="false" class="download-button"><i class="fa-duotone fa-solid fa-download"></i> Dowload image!</div>
    </div>
    <div class="game-area scrollbar-thumb-rounded-full scrollbar-track-rounded-full scrollbar-thin scrollbar-thumb-Silver scrollbar-track-EerieBlack">
        <p class="text-lg border-b border-Silver mb-1">Currently selected - drag and drop to change order of display</p>
        <div id="clearAll" tabindex="0" role="button" aria-pressed="false" class="clearAll"> Clear all</div>
        <div class="flex flex-wrap gap-4" ID="selected-elements-list">
        </div>
        <div class="categories-display pt-10 pb-2" role="tablist" id="CategoriesTabList">
            <?php
            $Loop=0;
            $FirstCategory="";
                $CostumesCategories = $bdd->query('SELECT * FROM Assets Group By Category ASC');
                while($SelectedCostumesCategorie= $CostumesCategories->fetch())
                {
                    if($Loop == 0)
                    {
                        $FirstCategory=$SelectedCostumesCategorie['Category'];
                    }
                    ?>
                        <div class="buttons interactive-tabs--trigger tab-list__items <?php if($Loop == 0){echo"tab-list__items--active";} ?>" data-tab="Categories-<?=$SelectedCostumesCategorie['Category']?>" data-list="CategoriesTabList" data-tab-previous="Categories-<?=$FirstCategory?>" data-tab-container="categories-container" role="tab" ><?=$SelectedCostumesCategorie['Category']?></div>
                    <?php
                    $Loop++;
                }
            ?>
        </div>
        <div class="max-h-full relative flex-grow w-full" ID="categories-container">
            <?php
            $Loop=0;
                $CostumesCategories = $bdd->query('SELECT * FROM Assets Group By Category ASC');
                while($SelectedCostumesCategorie= $CostumesCategories->fetch())
                {
                    ?>
                    <div id="Categories-<?=$SelectedCostumesCategorie['Category']?>" class="fading interactive-tabs <?php if($Loop == 0){echo"interactive-tabs--active !opacity-100 !static";} ?> w-full h-full" role="tabpanel">
                        <div class="absolute w-full">
                            <h2 class="border-b border-Silver mb-2"><?=$SelectedCostumesCategorie['Category']?></h2>
                            <div class="flex flex-wrap gap-6 w-full justify-center pb-10">
                                <?php
                                    $CostumesGroupedEvents = $bdd->query('SELECT * FROM Assets WHERE Category = "'.$SelectedCostumesCategorie['Category'].'"');
                                    while($SelectedCostumesGroupedEvents= $CostumesGroupedEvents->fetch())
                                    {
                                        if(!empty($SelectedCostumesGroupedEvents['Event']))
                                        {
                                            $Event=$SelectedCostumesGroupedEvents['Event']."/";
                                        }
                                        else
                                        {
                                            $Event="";
                                        }
                                        echo"<div class='icons_cards costume--trigger w-max aspect-square cursor-BoPointing' data-costume='".$SelectedCostumesGroupedEvents['ID']."' data-category='".$SelectedCostumesGroupedEvents['Category']."' tabindex='0' role='button' aria-pressed='false'><img src='pictures/renderings/".$SelectedCostumesGroupedEvents['Category']."/".$Event."".$SelectedCostumesGroupedEvents['Outfit']."".$SelectedCostumesGroupedEvents['Name']."_Icons.png' class='w-full' alt='".htmlentities($SelectedCostumesGroupedEvents['Alt'], ENT_QUOTES, "UTF-8")."'></div>";
                                    }
                                ?>
                            </div>
                        </div>
                    </div>
                    <?php
                    $Loop++;
                }
            ?>
        </div>
    </div>
</div>
    
<?php
include('includes/footer.php');
?> 