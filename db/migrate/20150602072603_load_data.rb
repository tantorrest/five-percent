class LoadData < ActiveRecord::Migration
  def up
    # Create initial projects.
    down
    p1 = Project.new(:title => "250 Winter Kits - Ersaal", :description => "This campaign aims to raise 250 winter kits for the refugees in Ersaal camp in Lebanon. The kits will be purchased wholesale from a vintage store in Tripoli, Lebanon and will be delivered directly to the camp",
     :location => "Ersaal - Lebanon", :founder => "Five Percent Movement", :img_file => "thumbnail1.jpg");
    p1.save(:validate => false)
    p2 = Project.new(:title => "Milk for Syrian Infants - September", :description => "Milk4Syria campaign aims to ensure communities inside Syria have a stable and consistent supply of baby formula each month",
     :location => "Idlib suburbs, Syria", :founder => "Karam Foundation", :img_file => "thumbnail2.jpg");
    p2.save(:validate => false)
    p3 = Project.new(:title => "Poultry Farm", :description => "إنشاء مركز لتربية الدواجن يحوي فوج ( والفوج يعني 1000 رأس من الدجاج) 
يصبح الصوص خلال 45 يوم دجاجة جاهزة للبيع لحم",
     :location => "Wadi Barada, Syria", :founder => "Ghiras Al Nahda", :img_file => "thumbnail3.jpg");
    p3.save(:validate => false)
    end

  def down
      Project.delete_all
  end
end
